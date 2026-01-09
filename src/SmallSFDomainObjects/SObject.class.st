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
	^ nil.
]

{ #category : 'instance creation' }
SObject class >> newFromDictionary: aDictionary [
    | type |
    type := self defaultSObjectType.
    
    (type isNil or: [ type isEmpty ]) 
        ifTrue: [ self error: self name, ' must implement defaultSObjectType to use this constructor.' ].

    ^ self newFromDictionary: aDictionary sObjectType: type
]

{ #category : 'instance creation' }
SObject class >> newFromDictionary: aDictionary sObjectType: aType [
	| aSObject |
	aSObject := self new.
	aSObject assignFromDictionary: aDictionary copy.
	aSObject attributes: (aDictionary at: 'attributes' ifAbsent: [ nil ]).
	aSObject sObjectType: aType.
	^ aSObject.
]

{ #category : 'instance creation' }
SObject class >> newFromResponse: aSalesforceResponse [
	| sObject |
	sObject := self new.
	sObject sObjectType: ''. "get from response"
	
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
    fields ifNil: [ fields := Dictionary new ].
    ^ fields
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SObject >> sObjectType [
	^ sObjectType.
]

{ #category : 'accessing' }
SObject >> sObjectType: aType [
	sObjectType := aType.
]
