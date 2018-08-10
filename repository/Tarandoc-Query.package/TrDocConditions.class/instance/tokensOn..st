printing
tokensOn: tokens
	conditions do: [ :each | each tokensOn: tokens ] separatedBy: [ tokens add: $& ].
	^tokens