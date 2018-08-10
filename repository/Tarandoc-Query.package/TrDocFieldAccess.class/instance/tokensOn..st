printing
tokensOn: tokens
	identifier ifNotNil: [:nm | tokens add: ('.', nm asString)].
	^tokens