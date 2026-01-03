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
SalesforceSObjectUrl class >> urlForSObject: aSObject session: aSession apiVersion: aVersion [
	^ (aSession instanceUrl), (self sObjectUrlPrefix: aVersion), '/', (aSObject sObjectType).
]
