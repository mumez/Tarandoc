printing
tokensOn: tokens
	self getElements do: [ :each | each tokensOn: tokens ].
	^tokens