Class {
	#name : 'SalesforceLoginDomain',
	#superclass : 'SalesforceDomain',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'private - accessing' }
SalesforceLoginDomain class >> loginEndpointPath [
	^ '/services/oauth2/token'.
]

{ #category : 'accessing' }
SalesforceLoginDomain class >> urlFor: aDomain [
	^ (self urlFromDomain: aDomain), (self loginEndpointPath)
]

{ #category : 'private - accessing' }
SalesforceLoginDomain class >> urlFromDomain: aDomain [
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
