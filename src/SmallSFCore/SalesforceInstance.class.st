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
SalesforceInstance >> create: aSObject [
	| fullUrl body sfResponse |
	fullUrl := SalesforceSObjectUrl urlForSObject: (aSObject sObjectType) session: aSession apiVersion: self apiVersion.
	body := aSObject payload.
	
	sfResponse := SalesforceConnector post: fullUrl body: body sessionId: aSession sessionId.
	
	(sfResponse wasSuccessful)
		ifTrue: [ 
			aSObject id: sfResponse id.
		].
	
]

{ #category : 'private - accessing' }
SalesforceInstance >> domain: aDomain [
	domain := aDomain.
]

{ #category : 'actions' }
SalesforceInstance >> find: aSObject withId: anId [
	| fullUrl sfResponse |
	fullUrl := SalesforceSObjectUrl urlForSObjectFind: aSObject sObjectType session: aSession apiVersion: (self apiVersion ) id: anId.
	sfResponse := SalesforceConnector get: fullUrl sessionId: aSession sessionId.
	
	(sfResponse wasSuccessful)
		ifTrue: [ 
			aSObject id: sfResponse id.
		].
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
