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
SObject class >> newFromDictionary: aDictionary [
    ^ self newFromDictionary: aDictionary sObjectType: self defaultSObjectType
]

{ #category : 'instance creation' }
SObject class >> newFromDictionary: aDictionary sObjectType: aType [
	| aSObject |
	aSObject := self new.
	aSObject assignFromDicationary: aDictionary copy.
	aSObject attributes: (aDictionary at: 'attributes' ifAbsent: [ nil ]).
	aSObject sObjectType: aType.
	^ aSObject.
]

{ #category : 'accessing' }
SObject >> assignFromDicationary: aDictionary [
	self id: (aDictionary at: 'id' ifAbsent: [ nil ]).
	self fields: (self pruneFields: aDictionary copy).
	
	dirtyFields := self isNew
		ifTrue: [ (self fields) keys asSet ] 
		ifFalse: [ Set new ].
	
	

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

{ #category : 'private - accessing' }
SObject >> fields [
    fields ifNil: [ fields := Dictionary new ].
    ^ fields
]

{ #category : 'private - accessing' }
SObject >> fields: aDictionary [
	fields := aDictionary copy.
	
	

]

{ #category : 'accessing' }
SObject >> id [
	^ id.
]

{ #category : 'accessing' }
SObject >> id: anId [
	id := anId.
]

{ #category : 'testing' }
SObject >> isNew [
    ^ self id isNil
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

{ #category : 'private - removing' }
SObject >> pruneFields: aDictionary [
	| cleanFields |
	cleanFields := aDictionary copy.
	cleanFields removeKey: 'attributes' ifAbsent: [ "does nothing, its gone already." ].
	cleanFields removeKey: 'id' ifAbsent: [ "does nothing already not there" ].
	^ cleanFields.
	
]

{ #category : 'accessing' }
SObject >> sObjectType [
	^ sObjectType.
]

{ #category : 'accessing' }
SObject >> sObjectType: aType [
	sObjectType := aType.
]
