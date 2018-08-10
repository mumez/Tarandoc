printing
tokensOn: tokens
	tokens add: $(.
	leftHand ifNotNil: [:lh | leftHand tokensOn: tokens].
	operator ifNotNil: [:lh | operator tokensOn: tokens].
	rightHand ifNotNil: [:lh | rightHand tokensOn: tokens].
	tokens add: $).
	^tokens