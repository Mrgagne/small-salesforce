Class {
	#name : 'SalesforcePasswordLogin',
	#superclass : 'SalesforceLogin',
	#instVars : [
		'username',
		'password',
		'consumerKey',
		'consumerSecret'
	],
	#category : 'SmallSFLoginComponents',
	#package : 'SmallSFLoginComponents'
}

{ #category : 'instance creation' }
SalesforcePasswordLogin class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret [
	|login|
	login := self new.
	login username: aUsername.
	login password: aPassword.
	login consumerKey: aConsumerKey.
	login consumerSecret: aConsumerSecret.
	^login
]

{ #category : 'initialization' }
SalesforcePasswordLogin >> consumerKey: aConsumerKey [
	consumerKey := aConsumerKey
]

{ #category : 'initialization' }
SalesforcePasswordLogin >> consumerSecret: aConsumerSecret [
	consumerSecret := aConsumerSecret
]

{ #category : 'initialization' }
SalesforcePasswordLogin >> password: aPassword [
	password := aPassword
]

{ #category : 'initialization' }
SalesforcePasswordLogin >> username: aUsername [
	username := aUsername
]
