Class {
	#name : 'Contact',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'helper' }
Contact class >> defaultSObjectType [
	^ 'Contact'
]

{ #category : 'instance creation' }
Contact class >> new [
	| aContact |
	aContact := super new.
	aContact sObjectType: self defaultSObjectType.
	^ aContact.
]
