Class {
	#name : 'Account',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'helper' }
Account class >> defaultSObjectType [
	^ 'Account'
]

{ #category : 'instance creation' }
Account class >> new [
	| anAccount |
	anAccount := super new.
	anAccount sObjectType: self defaultSObjectType.
	^ anAccount.
]

{ #category : 'instance creation' }
Account class >> newFromDictionary: aDictionary [
	| anAccount |
	anAccount := super newFromDictionary: aDictionary sObjectType: self defaultSObjectType.
	^ anAccount.
]
