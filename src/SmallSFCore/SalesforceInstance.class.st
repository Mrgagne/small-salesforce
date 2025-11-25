Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'salesforceConnector',
		'sandboxType',
		'aSalesforceLogin'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'instance creation' }
SalesforceInstance class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret [
	|anInstance|
	anInstance := self new.
	anInstance loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret.
	^anInstance.
]

{ #category : 'circuit setup' }
SalesforceInstance >> connect [
	salesforceConnector := SalesforceConnector new.
]

{ #category : 'initialization' }
SalesforceInstance >> loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret [
	aSalesforceLogin := SalesforceLogin 
		newUsername: aUsername 
		password: aPassword 
		consumerKey: aConsumerKey 
		consumerSecret: aConsumerSecret.
		
]
