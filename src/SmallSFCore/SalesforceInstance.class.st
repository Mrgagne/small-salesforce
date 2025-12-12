Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'domain',
		'aSalesforceLogin'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'instance creation' }
SalesforceInstance class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken domain: aDomain [
	|anInstance|
	anInstance := self new.
	anInstance domain: aDomain.
	anInstance loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken.
	^anInstance.
]

{ #category : 'helper' }
SalesforceInstance class >> urlFromDomain: aDomain [
	
]

{ #category : 'circuit setup' }
SalesforceInstance >> connect [
	"going to send salesforceconnector class the connect message"
	SalesforceConnector connectWithLogin: aSalesforceLogin.
]

{ #category : 'private - accessing' }
SalesforceInstance >> domain: aDomain [
	domain := aDomain.
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
