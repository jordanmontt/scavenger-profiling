Class {
	#name : #ScavengerProfiling,
	#superclass : #Object,
	#instVars : [
		'incrementalGCs',
		'fullGCs',
		'timeGarbageCollectingInMilliseconds'
	],
	#category : #ScavengerProfiling
}

{ #category : #'as yet unclassified' }
ScavengerProfiling >> runOneGBDF [

	self setStats.
	DataFrame readFromCsv: '/Users/sebastian/Downloads/csv/train.csv' asFileReference.
	self updateStats
]

{ #category : #'as yet unclassified' }
ScavengerProfiling >> runThreeGBDF [

	self setStats.
	DataFrame readFromCsv:
		'/Users/sebastian/Downloads/csv/Prot-RNA_corr_63gr.csv' asFileReference.
	self updateStats
]

{ #category : #initialization }
ScavengerProfiling >> setStats [

	incrementalGCs := Smalltalk vm incrementalGCCount.
	fullGCs := Smalltalk vm fullGCCount.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
]

{ #category : #initialization }
ScavengerProfiling >> updateStats [

	incrementalGCs := Smalltalk vm incrementalGCCount - incrementalGCs.
	fullGCs := Smalltalk vm fullGCCount - fullGCs.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
	                                       - timeGarbageCollectingInMilliseconds
]
