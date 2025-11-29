Class {
	#name : 'SalesforceConnector',
	#superclass : 'Object',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'utilities' }
SalesforceConnector class >> connectWithLogin: aLogin [
	| sfsession |
	"do connection"
	
	^sfsession.
]
