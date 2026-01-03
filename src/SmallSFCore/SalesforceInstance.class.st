Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'aSession',
		'domain',
		'aSalesforceLogin',
		'apiVersion'
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

{ #category : 'private - accessing' }
SalesforceInstance >> apiDataPrefix [
    ^ '/services/data/{1}/sobjects' format: { self apiVersion }
]

{ #category : 'private - accessing' }
SalesforceInstance >> apiVersion [
	^ apiVersion ifNil: [ ^ 'v64.0' ].
]

{ #category : 'actions' }
SalesforceInstance >> connect [
	|aFullUrl|
	aFullUrl := SalesforceLoginUrl urlFor: domain.
	aSession := SalesforceConnector connectWithLogin: aSalesforceLogin fullUrl: aFullUrl.
]

{ #category : 'actions' }
SalesforceInstance >> create: anSObject [
	| fullUrl body sfResponse |
	fullUrl := aSession instanceUrl, (self urlFor: anSObject).
	body := anSObject payload.
	
	sfResponse := SalesforceConnector post: fullUrl body: body sessionId: aSession sessionId.
	
	(sfResponse wasSuccessful)
		ifTrue: [ 
			anSObject id: sfResponse id.
		].
	
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

{ #category : 'private - accessing' }
SalesforceInstance >> urlFor: anSObject [
	^ self apiDataPrefix , '/' , anSObject sObjectType.
]
