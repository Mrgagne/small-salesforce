Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'aSession',
		'apiVersion',
		'aGateway'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'private - accessing' }
SalesforceInstance >> apiVersion [
	^ apiVersion ifNil: [ ^ 'v64.0' ].
]

{ #category : 'actions' }
SalesforceInstance >> create: aSObject [
	| fullUrl body response |
	fullUrl := SalesforceSObjectUrl urlForSObject: (aSObject sObjectType) session: aSession apiVersion: self apiVersion.
	body := aSObject payload.
	
	response := SalesforceConnector post: fullUrl body: body sessionId: aSession sessionId.
	aSObject handleCreationResponse: response.
	
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
