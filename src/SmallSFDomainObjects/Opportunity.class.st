Class {
	#name : 'Opportunity',
	#superclass : 'SObject',
	#category : 'SmallSFDomainObjects',
	#package : 'SmallSFDomainObjects'
}

{ #category : 'instance creation' }
Opportunity class >> new [
	| anOpportunity |
	anOpportunity := super new.
	anOpportunity sObjectType: 'Opportunity'.
	^ anOpportunity.
]
