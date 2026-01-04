Class {
	#name : 'Salesforce',
	#superclass : 'Object',
	#instVars : [
		'salesforceInstance'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'instance creation' }
Salesforce class >> loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken domain: aDomain [
	|sf|
	sf := self new.
	sf connectToInstanceUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken domain: aDomain.
	^sf
]

{ #category : 'circuit setup' }
Salesforce >> connect [
	salesforceInstance connect.
]

{ #category : 'private - accessing' }
Salesforce >> connectToInstanceUsername: aUsername 
    password: aPassword 
    consumerKey: aConsumerKey 
    consumerSecret: aConsumerSecret
	 securityToken: aSecurityToken
	 domain: aDomain [	

    salesforceInstance := SalesforceInstance 
        newUsername: aUsername 
        password: aPassword 
        consumerKey: aConsumerKey 
        consumerSecret: aConsumerSecret
		  securityToken: aSecurityToken
		  domain: aDomain.

]

{ #category : 'actions' }
Salesforce >> create: anObject [
	salesforceInstance create: anObject.
]

{ #category : 'actions' }
Salesforce >> find: sObjectType with: anId [
	^ (self find: sObjectType withCollection: (OrderedCollection with: anId)).
]

{ #category : 'actions' }
Salesforce >> find: sObjectType withCollection: idList [
	^ salesforceInstance find: sObjectType withCollection: idList copy.
]
