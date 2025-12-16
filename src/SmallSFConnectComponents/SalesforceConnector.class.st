Class {
	#name : 'SalesforceConnector',
	#superclass : 'Object',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'utilities' }
SalesforceConnector class >> connectWithLogin: aLogin domain: aDomain [
	| session aJsonResponse |
	aJsonResponse := self performCallout: aLogin domain: aDomain.
	session := SalesforceSession newFromJson: aJsonResponse.
	^ session.
]

{ #category : 'accessing - classes' }
SalesforceConnector class >> loginEndpointPath [
	^ '/services/oauth2/token'.
]

{ #category : 'utilities' }
SalesforceConnector class >> performCallout: aLogin domain: aDomain [
	| client |
	client := ZnClient new.
	client 
		url: aDomain, self loginEndpointPath;
		formAddAll: aLogin requestFields;
		post.
	^ client response entity contents.
]
