Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'sandboxType',
		'aSalesforceLogin'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'instance creation' }
SalesforceInstance class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken [
	|anInstance|
	anInstance := self new.
	anInstance loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken.
	^anInstance.
]

{ #category : 'circuit setup' }
SalesforceInstance >> connect [
	"going to send salesforceconnector class the connect message"
	SalesforceConnector connectWithLogin: aSalesforceLogin.
]

{ #category : 'initialization' }
SalesforceInstance >> loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken [
	aSalesforceLogin := SalesforcePasswordLogin 
		newUsername: aUsername 
		password: aPassword 
		consumerKey: aConsumerKey 
		consumerSecret: aConsumerSecret
		securityToken: aSecurityToken.
		
]
