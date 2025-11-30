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
Salesforce class >> loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken [
	|sf|
	sf := self new.
	sf connectToInstanceUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken.
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
	 securityToken: aSecurityToken [

    salesforceInstance := SalesforceInstance 
        newUsername: aUsername 
        password: aPassword 
        consumerKey: aConsumerKey 
        consumerSecret: aConsumerSecret
		  securityToken: aSecurityToken.

]
