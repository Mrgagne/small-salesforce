Class {
	#name : 'SalesforcePasswordLogin',
	#superclass : 'SalesforceLogin',
	#instVars : [
		'username',
		'password',
		'consumerKey',
		'consumerSecret',
		'securityToken'
	],
	#category : 'SmallSFLoginComponents',
	#package : 'SmallSFLoginComponents'
}

{ #category : 'instance creation' }
SalesforcePasswordLogin class >> newUsername: aUsername password: aPassword consumerKey: aConsumerKey consumerSecret: aConsumerSecret securityToken: aSecurityToken [
	|login|
	login := self new.
	login username: aUsername.
	login password: aPassword.
	login consumerKey: aConsumerKey.
	login consumerSecret: aConsumerSecret.
	login securityToken: aSecurityToken.
	^login
]

{ #category : 'accessing - structure variables' }
SalesforcePasswordLogin >> asDictionary [
	^ { 
		'grant_type' -> 'password'.
		'client_id' -> consumerKey.
		'client_secret' -> consumerSecret.
		'username' -> username.
		'password' -> self fullPassword.
	 } asDictionary 
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> consumerKey: aConsumerKey [
	consumerKey := aConsumerKey
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> consumerSecret: aConsumerSecret [
	consumerSecret := aConsumerSecret
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> fullPassword [
	^ securityToken
		ifNil: [ password ]
		ifNotNil: [ password , securityToken ].
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> password: aPassword [
	password := aPassword
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> securityToken: aSecurityToken [
	securityToken := aSecurityToken
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> username: aUsername [
	username := aUsername
]
