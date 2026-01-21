Class {
	#name : 'SalesforceLoginUrl',
	#superclass : 'SalesforceUrl',
	#category : 'SmallSFHTTP',
	#package : 'SmallSFHTTP'
}

{ #category : 'private - accessing' }
SalesforceLoginUrl class >> loginEndpointPath [
	^ '/services/oauth2/token'.
]

{ #category : 'accessing' }
SalesforceLoginUrl class >> urlFor: aDomain [
	^ (self urlFromDomain: aDomain), (self loginEndpointPath)
]

{ #category : 'private - accessing' }
SalesforceLoginUrl class >> urlFromDomain: aDomain [
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
