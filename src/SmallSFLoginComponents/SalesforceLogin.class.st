Class {
	#name : 'SalesforceLogin',
	#superclass : 'Object',
	#category : 'SmallSFLoginComponents',
	#package : 'SmallSFLoginComponents'
}

{ #category : 'converting' }
SalesforceLogin >> asDictionary [
	self subclassResponsibility.
]

{ #category : 'converting' }
SalesforceLogin >> asFormUrlEncoded [
	| dict |
	dict := self asDictionary.
	^ (String streamContents: [:s |
		dict keysAndValuesDo: [:key :value |
			s
				nextPutAll: (ZnPercentEncoder new encode: key asString);
				nextPut: $=;
				nextPutAll: (ZnPercentEncoder new encode: value asString);
				nextPut: $& ] ])
		allButLast.

]
