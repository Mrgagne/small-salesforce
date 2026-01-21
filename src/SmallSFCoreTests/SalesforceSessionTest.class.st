Class {
	#name : 'SalesforceSessionTest',
	#superclass : 'TestCase',
	#category : 'SmallSFCoreTests',
	#package : 'SmallSFCoreTests'
}

{ #category : 'tests' }
SalesforceSessionTest >> testSuccessfulSessionResponse [
	| response session |
	response := ZnResponse new
		statusLine: ZnStatusLine ok;
		entity: (ZnEntity json: '{"id":"https://login.salesforce.com/id/00Dx0000000BV7z/005x00000012Q9P","issued_at":"1278448832702","instance_url":"https://yourInstance.salesforce.com/","signature":"0CmxinZir53Yex7nE0TD+zMpvIWYGb/bdJh6XfOH6EQ=","access_token":"00Dx0000000BV7z!AR8AQAxo9UfVkh8AlV0Gomt9Czx9LjHnSSpwBMmbRcgKFmxOtvxjTrKW19ye6PE3Ds1eQz3z8jr3W7_VbWmEu4Q8TVGSTHxs","token_type":"Bearer"}');
		yourself.
		
	session := SalesforceSession newFromResponse: response.
	
	self assert: session instanceUrl equals: 'https://yourInstance.salesforce.com/'.
	self assert: session sessionId equals: '00Dx0000000BV7z!AR8AQAxo9UfVkh8AlV0Gomt9Czx9LjHnSSpwBMmbRcgKFmxOtvxjTrKW19ye6PE3Ds1eQz3z8jr3W7_VbWmEu4Q8TVGSTHxs'.
	self assert: session issuedAt equals: '1278448832702'.
]

{ #category : 'tests' }
SalesforceSessionTest >> testUnsuccessfulSessionResponse [
	| response session |
	response := ZnResponse new
		statusLine: ZnStatusLine badRequest;
		entity: (ZnEntity json: '{"error":"invalid_grant","error_description":"expired access/refresh token"}');
		yourself.
		
	self should: [ session := SalesforceSession newFromResponse: response. ] raise: Error.
]
