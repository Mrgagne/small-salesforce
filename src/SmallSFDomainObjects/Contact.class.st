Class {
	#name : 'Contact',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'instance creation' }
Contact class >> new [
	| aContact |
	aContact := super new.
	aContact sObjectType: 'Contact'.
	^ aContact.
]
