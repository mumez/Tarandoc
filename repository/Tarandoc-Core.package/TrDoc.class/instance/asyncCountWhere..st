counting
asyncCountWhere: queryBlock
	^self asyncCount: (self queryArrayByQuerying: queryBlock)