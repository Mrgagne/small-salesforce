Class {
	#name : 'Case',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'helper' }
Case class >> defaultSObjectType [
	^ 'Case'
]

{ #category : 'instance creation' }
Case class >> new [
	| aCase |
	aCase := super new.
	aCase sObjectType: self defaultSObjectType.
	^ aCase.
]
