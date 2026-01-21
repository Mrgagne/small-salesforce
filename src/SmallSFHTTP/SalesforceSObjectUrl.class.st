Class {
	#name : 'SalesforceSObjectUrl',
	#superclass : 'SalesforceUrl',
	#category : 'SmallSFHTTP',
	#package : 'SmallSFHTTP'
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
SalesforceSObjectUrl class >> urlForSObjectFind: sObjectType session: aSession apiVersion: apiVersion id: anId [
	| fullUrl |
	fullUrl := (self urlForSObject: sObjectType session: aSession  apiVersion: apiVersion).
	^ fullUrl, '/', anId.
]
