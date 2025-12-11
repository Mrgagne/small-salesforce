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
	Transcript show: aJsonResponse.
	session := SalesforceSession newFromJson: aJsonResponse.
	^session.
]

{ #category : 'utilities' }
SalesforceConnector class >> performCallout: aLogin [
	| client |
	client := ZnClient new.
	client 
		url: 'https://kaufman4-dev-ed.develop.my.salesforce.com/services/oauth2/token';
		formAddAll: aLogin requestFields;
		post.
	^ client response entity contents.
]
