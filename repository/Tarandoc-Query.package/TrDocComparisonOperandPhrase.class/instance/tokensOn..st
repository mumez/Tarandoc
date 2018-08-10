printing
tokensOn: tokens
	phrase ifNotNil: [:nm | phrase tokensOn: tokens].
	^tokens