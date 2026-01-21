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
	^ anInstance.
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
	| fullUrl body response |
	fullUrl := SalesforceSObjectUrl urlForSObject: (aSObject sObjectType) session: aSession apiVersion: self apiVersion.
	body := aSObject payload.
	
	response := SalesforceConnector post: fullUrl body: body sessionId: aSession sessionId.
	aSObject handleCreationResponse: response.
	
]

{ #category : 'private - accessing' }
SalesforceInstance >> domain: aDomain [
	domain := aDomain.
]

{ #category : 'actions' }
SalesforceInstance >> find: classType thatIsA: sobjectType withId: anId [
	| fullUrl response aSObject |
	fullUrl := SalesforceSObjectUrl urlForSObjectFind: sobjectType session: aSession apiVersion: (self apiVersion ) id: anId.
	response := SalesforceConnector get: fullUrl sessionId: aSession sessionId.
	aSObject := SObject newFrom: response.
	^ aSObject.
]

{ #category : 'actions' }
SalesforceInstance >> find: aSObject withId: anId [
	| fullUrl response |
	fullUrl := SalesforceSObjectUrl urlForSObjectFind: aSObject sObjectType session: aSession apiVersion: (self apiVersion ) id: anId.
	response := SalesforceConnector get: fullUrl sessionId: aSession sessionId.
	^ aSObject newFrom: response.
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
