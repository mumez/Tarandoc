actions
countAll
	^self countWhere: [ :each | each id > 0 ]