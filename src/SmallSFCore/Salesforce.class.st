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
	|aFullUrl|
	
	aFullUrl := SalesforceInstance urlFromDomain: aDomain.
    salesforceInstance := SalesforceInstance 
        newUsername: aUsername 
        password: aPassword 
        consumerKey: aConsumerKey 
        consumerSecret: aConsumerSecret
		  securityToken: aSecurityToken
		  domain: aFullUrl.

]

{ #category : 'actions' }
Salesforce >> create: anObject [
	salesforceInstance create: anObject.
]
