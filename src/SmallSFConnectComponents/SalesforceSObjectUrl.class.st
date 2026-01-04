Class {
	#name : 'SalesforceSObjectUrl',
	#superclass : 'SalesforceUrl',
	#category : 'SmallSFConnectComponents',
	#package : 'SmallSFConnectComponents'
}

{ #category : 'private - accessing' }
SalesforceSObjectUrl class >> sObjectUrlPrefix: aVersion [
	^ '/services/data/{1}/sobjects' format: { aVersion }
]

{ #category : 'accessing' }
SalesforceSObjectUrl class >> urlForSObject: aSObjectType session: aSession apiVersion: aVersion [
	^ (aSession instanceUrl), (self sObjectUrlPrefix: aVersion), '/', aSObjectType.
]

{ #category : 'accessing' }
SalesforceSObjectUrl class >> urlForSObjectQuery: sObjectType session: aSession apiVersion: apiVersion ids: idList [
	| fullUrl |
	fullUrl := (self urlForSObject: sObjectType session: aSession  apiVersion: apiVersion).
	^ fullUrl, '?=', (idList joinUsing: ',').
]
