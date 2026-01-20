Class {
	#name : 'SalesforceSession',
	#superclass : 'Object',
	#instVars : [
		'sessionId',
		'instanceUrl',
		'tokenType',
		'issuedAt'
	],
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'instance creation' }
SalesforceSession class >> newFromResponse: aResponse [
	| session json | 
	json := NeoJSONReader fromString: (aResponse entity string).
	
	session := self new.
	(aResponse isError) ifTrue: [ session handleError: json ].
	session handleSessionCreation: json.
	^ session.
]

{ #category : 'private - utilities' }
SalesforceSession >> destructureJson: json [
	self sessionId: (json at: 'access_token').
	self instanceUrl: (json at: 'instance_url').
	self issuedAt: (json at: 'issued_at').
	
	^ self
]

{ #category : 'error handling' }
SalesforceSession >> handleError: json [
	self error: (json at: 'error'), ' ', (json at: 'error_description').
]

{ #category : 'private - utilities' }
SalesforceSession >> handleSessionCreation: json [
	self destructureJson: json
]

{ #category : 'accessing' }
SalesforceSession >> instanceUrl [
	^ instanceUrl.
]

{ #category : 'private - accessing' }
SalesforceSession >> instanceUrl: anInstanceUrl [
	instanceUrl := anInstanceUrl
]

{ #category : 'accessing' }
SalesforceSession >> issuedAt [ 
	^ issuedAt.
]

{ #category : 'private - accessing' }
SalesforceSession >> issuedAt: anIssuedTime [
	issuedAt := anIssuedTime 
]

{ #category : 'accessing' }
SalesforceSession >> sessionId [
	^ sessionId.
]

{ #category : 'private - accessing' }
SalesforceSession >> sessionId: aSessionId [
	sessionId := aSessionId
]
