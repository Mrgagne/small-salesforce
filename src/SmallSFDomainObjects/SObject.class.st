Class {
	#name : 'SObject',
	#superclass : 'Object',
	#instVars : [
		'fields',
		'dirtyFields',
		'sObjectType'
	],
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'accessing' }
SObject >> at: aFieldName put: aValue [
	self fields at: aFieldName put: aValue.
	self dirtyFields at: aFieldName put: aValue.
]

{ #category : 'accessing' }
SObject >> dirtyFields [
	^ dirtyFields ifNil: [ dirtyFields := Set new ].
]

{ #category : 'accessing' }
SObject >> fields [
	^ fields ifNil: [ fields := Dictionary new ].
]

{ #category : 'accessing' }
SObject >> sObjectType: aType [
	sObjectType := aType.
]
