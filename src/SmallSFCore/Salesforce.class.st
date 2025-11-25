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
Salesforce class >> loginUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret [
	|sf|
	sf := self new.
	sf connectToInstanceUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret.
	^sf
]

{ #category : 'as yet unclassified' }
Salesforce >> connectToInstanceUsername: aUsername 
    password: aPassword 
    consumerKey: aConsumerKey 
    consumerSecret: aConsumerSecret [

    salesforceInstance := SalesforceInstance 
        newUsername: aUsername 
        password: aPassword 
        consumerKey: aConsumerKey 
        consumerSecret: aConsumerSecret.

]
