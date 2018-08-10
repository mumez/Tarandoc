converting
tokenArray
	| tokens |
	tokens := OrderedCollection new.
	self tokensOn: tokens.
	^tokens