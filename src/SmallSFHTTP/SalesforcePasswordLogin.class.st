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
	#category : 'SmallSFHTTP',
	#package : 'SmallSFHTTP'
}

{ #category : 'accessing' }
SalesforcePasswordLogin >> consumerKey: aConsumerKey [
	consumerKey := aConsumerKey
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> consumerSecret: aConsumerSecret [
	consumerSecret := aConsumerSecret
]

{ #category : 'private - accessing' }
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
SalesforcePasswordLogin >> requestFields [
	^ { 
		'grant_type' -> 'password'.
		'client_id' -> consumerKey.
		'client_secret' -> consumerSecret.
		'username' -> username.
		'password' -> self fullPassword.
	 } asDictionary 
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> securityToken: aSecurityToken [
	securityToken := aSecurityToken
]

{ #category : 'accessing' }
SalesforcePasswordLogin >> username: aUsername [
	username := aUsername
]
