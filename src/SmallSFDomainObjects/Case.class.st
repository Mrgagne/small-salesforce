Class {
	#name : 'Case',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'instance creation' }
Case class >> new [
	| aCase |
	aCase := super new.
	aCase sObjectType: 'Case'.
	^ aCase.
]
