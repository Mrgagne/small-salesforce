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

{ #category : 'helper' }
SalesforceInstance class >> urlFromDomain: aDomain [
	| fullUrl |

    (aDomain beginsWith: 'http') 
        ifTrue: [ ^ aDomain ]. 

    fullUrl := 'https://'.

    ^ aDomain caseOf: {
        ['login'] -> [ fullUrl, 'login.salesforce.com' ].
        ['test']  -> [ fullUrl, 'test.salesforce.com' ].
    } otherwise: [
        fullUrl, aDomain, '.my.salesforce.com'
    ]
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
	aSession := SalesforceConnector connectWithLogin: aSalesforceLogin domain: domain.
]

{ #category : 'actions' }
SalesforceInstance >> create: anSObject [
	| fullUrl body |
	fullUrl := aSession instanceUrl, (self urlFor: anSObject).
	body := anSObject payload.
	
	SalesforceConnector post: fullUrl body: body sessionId: aSession sessionId.
	
	
	
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
