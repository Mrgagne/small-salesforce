Class {
	#name : 'SalesforceConnector',
	#superclass : 'Object',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'utilities' }
SalesforceConnector class >> connectWithLogin: aLogin fullUrl: aFullUrl [
	| session response |
	response := self performCallout: aLogin fullUrl: aFullUrl.
	session := SalesforceSession newFromJson: response.
	^ session.
]

{ #category : 'utilities' }
SalesforceConnector class >> get: aFullUrl sessionId: aSessionId [
| response |
	response := (ZnResponse new)
		url: aFullUrl;
		headerAt: 'Authorization' put: 'Bearer ', aSessionId;
		headerAt: 'Accept' put: 'application/json';
		get;
		response.
	^ response.
]

{ #category : 'utilities' }
SalesforceConnector class >> performCallout: aLogin fullUrl: aFullUrl [
	| response |
	response := (ZnClient new) 
		url: aFullUrl;
		formAddAll: aLogin requestFields;
		post;
		response.
	^ response.
]

{ #category : 'utilities' }
SalesforceConnector class >> post: aUrl body: aBody sessionId: aSessionId [
	| response |
	response := (ZnClient new)
		url: aUrl;
		headerAt: 'Authorization' put: 'Bearer ', aSessionId;
		headerAt: 'Content-Type' put: 'application/json';
		entity: (ZnEntity json: (NeoJSONWriter toString: aBody));
		post;
		response.
	^ response.
]
