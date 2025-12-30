Class {
	#name : 'SObject',
	#superclass : 'Object',
	#instVars : [
		'fields',
		'dirtyFields',
		'sObjectType',
		'id',
		'attributes'
	],
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'helper' }
SObject class >> defaultSObjectType [
	self subclassResponsibility.
]

{ #category : 'instance creation' }
SObject class >> newFromDictionary: aDictionary sObjectType: aType [
	| aSObject |
	aSObject := self new.
	aSObject fields: aDictionary copy.
	aSObject attributes: (aDictionary at: 'attributes' ifAbsent: [ nil ]).
	aSObject sObjectType: aType.
	^ aSObject.
]

{ #category : 'accessing' }
SObject >> at: aFieldName put: aValue [
	self fields at: aFieldName put: aValue.
	self dirtyFields add: aFieldName.
]

{ #category : 'accessing' }
SObject >> attributes: aDictionary [
	attributes := aDictionary 
        ifNil: [ Dictionary new ] 
        ifNotNil: [ aDictionary copy ].
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
SObject >> fields: aDictionary [
	| cleanFields | 
	cleanFields := aDictionary copy.
	cleanFields removeKey: 'attributes' ifAbsent: [ "does nothing, its gone already." ].
	fields := cleanFields.

]

{ #category : 'accessing' }
SObject >> id: anId [
	id := anId.
	fields at: 'Id' put: anId.
]

{ #category : 'accessing' }
SObject >> payload [
    | data |
    data := Dictionary new.
    
    self dirtyFields do: [ :fieldName | 
        | val |
        val := self fields at: fieldName.
        data at: fieldName put: val ].
        
    ^ data
]

{ #category : 'accessing' }
SObject >> sObjectType [
	^ sObjectType.
]

{ #category : 'accessing' }
SObject >> sObjectType: aType [
	sObjectType := aType.
]
