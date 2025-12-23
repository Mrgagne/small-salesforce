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
	self dirtyFields add: aValue.
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
SObject >> payload [
    | data |
    data := Dictionary new.
    
    "Go through every name in our 'Shopping List'"
    self dirtyFields do: [ :fieldName | 
        | val |
        "Go look up the actual value in the 'Store' using that name"
        val := self fields at: fieldName.
        
        "Put it into the final JSON dictionary"
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
