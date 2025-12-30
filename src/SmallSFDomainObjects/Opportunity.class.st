Class {
	#name : 'Opportunity',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'helper' }
Opportunity class >> defaultSObjectType [
	^ 'Opportunity'.
]

{ #category : 'instance creation' }
Opportunity class >> new [
	| anOpportunity |
	anOpportunity := super new.
	anOpportunity sObjectType: self defaultSObjectType.
	^ anOpportunity.
]
