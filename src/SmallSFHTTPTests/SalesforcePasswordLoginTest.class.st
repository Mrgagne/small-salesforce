Class {
	#name : 'SalesforcePasswordLoginTest',
	#superclass : 'TestCase',
	#category : 'SmallSFHTTPTests',
	#package : 'SmallSFHTTPTests'
}

{ #category : 'tests' }
SalesforcePasswordLoginTest >> testInstanceCreation [
	| aLogin expectedDictionary |
	aLogin := SalesforcePasswordLogin new
				password: 'Hello';
				username: 'World';
				securityToken: 'aToken';
				consumerKey: 'consumerKey';
				consumerSecret: 'consumerSecret'.
	
	expectedDictionary := { 
		'grant_type' -> 'password'.
		'client_id' -> 'consumerKey'.
		'client_secret' -> 'consumerSecret'.
		'username' -> 'World'.
		'password' -> 'HelloaToken'.
	 } asDictionary.
	
	self assert: expectedDictionary equals: aLogin requestFields.
]
