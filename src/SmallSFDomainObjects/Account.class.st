Class {
	#name : 'Account',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'instance creation' }
Account class >> new [
	| anAccount |
	anAccount := super new.
	anAccount sObjectType: 'Account'.
	^ anAccount.
]
