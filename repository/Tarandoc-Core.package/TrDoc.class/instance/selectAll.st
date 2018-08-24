actions
selectAll
	^self selectWhere: [ :each | each id > 0 ]