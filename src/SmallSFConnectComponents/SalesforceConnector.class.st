Class {
	#name : 'SalesforceConnector',
	#superclass : 'Object',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'utilities' }
SalesforceConnector class >> connectWithLogin: aLogin [
	| session aJsonResponse |
	aJsonResponse := self performCallout: aLogin.
	session := SalesforceSession newFromJson: aJsonResponse.
	^session.
]

{ #category : 'utilities' }
SalesforceConnector class >> performCallout: aLogin [
	| client |
	Transcript show: aLogin asFormUrlEncoded.
	client := ZnClient new.
	client 
		url: 'https://kaufman4-dev-ed.develop.my.salesforce.com/services/oauth2/token';
		entity: (ZnEntity 
						with: aLogin asFormUrlEncoded
						type: ZnMimeType applicationFormUrlEncoded).
	client request inspect.
	^ client response.
]
