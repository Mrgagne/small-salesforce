Class {
	#name : 'SalesforceSession',
	#superclass : 'Object',
	#instVars : [
		'sessionId',
		'instanceUrl',
		'tokenType',
		'issuedAt',
		'jsonResponse'
	],
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'instance creation' }
SalesforceSession class >> newFromJson: aJsonResponse [
	| session | 
	session := self new.
	session jsonResponse: aJsonResponse.
	session destructureJson.
	^session
]

{ #category : 'utilities' }
SalesforceSession >> destructureJson [
	| json |
	json := NeoJSONReader fromString: jsonResponse.
	self sessionId: (json at: 'access_token').
	self instanceUrl: (json at: 'instance_url').
	self issuedAt: (json at: 'issued_at').
	
	^self
	

]

{ #category : 'private - accessing' }
SalesforceSession >> instanceUrl: anInstanceUrl [
	instanceUrl := anInstanceUrl
]

{ #category : 'private - accessing' }
SalesforceSession >> issuedAt: anIssuedTime [
	issuedAt := anIssuedTime 
]

{ #category : 'setter' }
SalesforceSession >> jsonResponse: aJsonResponse [
	jsonResponse := aJsonResponse
]

{ #category : 'private - accessing' }
SalesforceSession >> sessionId: aSessionId [
	sessionId := aSessionId
]
