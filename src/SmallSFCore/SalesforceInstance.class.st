Class {
	#name : 'SalesforceInstance',
	#superclass : 'Object',
	#instVars : [
		'aSession',
		'domain',
		'aSalesforceLogin'
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

    "If the input is already a full URL, return it immediately (robustness)"
    (aDomain beginsWith: 'http') 
        ifTrue: [ ^ aDomain ]. 

    fullUrl := 'https://'.

    ^ aDomain caseOf: {
        ['login'] -> [ fullUrl, 'login.salesforce.com' ].
        ['test']  -> [ fullUrl, 'test.salesforce.com' ].
    } otherwise: [
        "Default: Assume it is a 'My Domain' identifier"
        fullUrl, aDomain, '.my.salesforce.com'
    ]
]

{ #category : 'circuit setup' }
SalesforceInstance >> connect [
	aSession := SalesforceConnector connectWithLogin: aSalesforceLogin domain: domain.
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
