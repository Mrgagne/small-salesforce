Class {
	#name : 'SObject',
	#superclass : 'Object',
	#instVars : [
		'fields',
		'dirtyFields',
		'sObjectType',
		'id'
	],
	#category : 'SmallSFCore',
	#package : 'SmallSFCore'
}

{ #category : 'helper' }
SObject class >> defaultSObjectType [
	^ nil.
]

{ #category : 'instance creation' }
SObject class >> new: aType [
	| sObject |
	sObject := self new.
	sObject sObjectType: aType.
	^ sObject.
]

{ #category : 'instance creation' }
SObject class >> newFrom: aResponse [
	| sObject json |
	json := NeoJSONReader fromString: (aResponse entity string).
	
	sObject := self new.
	sObject extractAttributes: (json at: 'attributes').
	json removeKey: 'attributes'.
	sObject fields: json.
	sObject id: (json at: 'Id').
	^ sObject.
]

{ #category : 'accessing' }
SObject >> at: aFieldName put: aValue [
	self fields at: aFieldName put: aValue.
	self dirtyFields add: aFieldName.
]

{ #category : 'accessing' }
SObject >> dirtyFields [
	^ dirtyFields ifNil: [ dirtyFields := Set new ].
]

{ #category : 'private - accessing' }
SObject >> extractAttributes: json [
	self sObjectType: (json at: 'type').
	^ self.
]

{ #category : 'accessing' }
SObject >> fields [
    fields ifNil: [ fields := Dictionary new ].
    ^ fields
]

{ #category : 'private - accessing' }
SObject >> fields: aDictionary [
	fields := aDictionary copy.
	
	

]

{ #category : 'actions' }
SObject >> handleCreationResponse: aResponse [
	| jsonString |
	jsonString := NeoJSONReader fromString: (aResponse entity string).
	(aResponse isError) ifTrue: [ self handleError: jsonString ].
	self populateFromCreateResponse: jsonString.
]

{ #category : 'error handling' }
SObject >> handleError: jsonString [
	^ self error: ((jsonString first) at: 'message').
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

{ #category : 'actions' }
SObject >> populateFromCreateResponse: jsonString [
	self id: (jsonString at: 'id').
]

{ #category : 'accessing' }
SObject >> sObjectType [
	^ sObjectType.
]

{ #category : 'accessing' }
SObject >> sObjectType: aType [
	sObjectType := aType.
]
