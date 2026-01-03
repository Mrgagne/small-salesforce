Class {
	#name : 'SalesforceConnector',
	#superclass : 'Object',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'utilities' }
SalesforceConnector class >> connectWithLogin: aLogin fullUrl: aFullUrl [
	| session aJsonResponse |
	aJsonResponse := self performCallout: aLogin fullUrl: aFullUrl.
	session := SalesforceSession newFromJson: aJsonResponse.
	^ session.
]

{ #category : 'utilities' }
SalesforceConnector class >> performCallout: aLogin fullUrl: aFullUrl [
	| client |
	client := ZnClient new.
	client 
		url: aFullUrl;
		formAddAll: aLogin requestFields;
		post.
	^ client response entity contents.
]

{ #category : 'utilities' }
SalesforceConnector class >> post: aUrl body: aBody sessionId: aSessionId [
	| client sfResponse jsonResponse statusCode |
	client := ZnClient new.
	client 
		url: aUrl;
		headerAt: 'Authorization' put: 'Bearer ', aSessionId;
		headerAt: 'Content-Type' put: 'application/json';
		entity: (ZnEntity json: (NeoJSONWriter toString: aBody));
		post.
	jsonResponse := NeoJSONReader fromString: client response entity string.
	statusCode := client response statusLine code.
	sfResponse := SalesforceResponse newJson: jsonResponse statusCode: statusCode.
	^ sfResponse.
]
