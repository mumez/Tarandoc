actions
deleteWhere: queryBlock
	^self asyncDelete: (self queryArrayByQuerying: queryBlock)