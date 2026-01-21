Class {
	#name : 'SalesforceLogin',
	#superclass : 'Object',
	#category : 'SmallSFHTTP',
	#package : 'SmallSFHTTP'
}

{ #category : 'accessing' }
SalesforceLogin >> requestFields [
	self subclassResponsibility.
]
