reflective operations
doesNotUnderstand: aMessage
	aMessage selector isUnary
		ifTrue: [ ^self copiedPhrase addFieldAccess: aMessage selector ].
	^ super doesNotUnderstand: aMessage