Class {
	#name : 'SalesforceResponse',
	#superclass : 'Object',
	#instVars : [
		'jsonResponse',
		'statusCode'
	],
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'instance creation' }
SalesforceResponse class >> newJson: aSFJsonResponse statusCode: aStatusCode [
	| sfresponse |
	sfresponse := self new.
	sfresponse jsonResponse: aSFJsonResponse.
	sfresponse statusCode: aStatusCode.
	^ sfresponse.
]

{ #category : 'accessing' }
SalesforceResponse >> id [
	^ jsonResponse at: 'id' ifAbsent: [ nil ].
]

{ #category : 'accessing' }
SalesforceResponse >> jsonResponse: aJsonResponse [
	jsonResponse := aJsonResponse.
]

{ #category : 'accessing' }
SalesforceResponse >> statusCode: aStatusCode [
	statusCode := aStatusCode.
]

{ #category : 'accessing - computed' }
SalesforceResponse >> wasSuccessful [
    ^ statusCode >= 200 and: [ statusCode < 300 ]
]
