Class {
	#name : 'SalesforceLogin',
	#superclass : 'Object',
	#instVars : [
		'username',
		'password',
		'securityToken',
		'consumerKey',
		'consumerSecret'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'instance creation' }
SalesforceLogin class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret [
	|login|
	login := self new.
	login username: aUsername.
	login password: aPassword.
	login consumerKey: aConsumerKey.
	login consumerSecret: aConsumerSecret.
	^login
]

{ #category : 'initialization' }
SalesforceLogin >> consumerKey: aConsumerKey [
	consumerKey := aConsumerKey
]

{ #category : 'initialization' }
SalesforceLogin >> consumerSecret: aConsumerSecret [
	consumerSecret := aConsumerSecret
]

{ #category : 'initialization' }
SalesforceLogin >> password: aPassword [
	password := aPassword
]

{ #category : 'initialization' }
SalesforceLogin >> username: aUsername [
	username := aUsername
]
