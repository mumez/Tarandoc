printing
tokensOn: tokens
	self value ifNotNil: [:val | tokens add: val].
	^tokens