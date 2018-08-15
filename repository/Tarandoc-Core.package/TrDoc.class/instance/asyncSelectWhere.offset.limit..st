selecting
asyncSelectWhere: queryBlock offset: offset limit: limit
	^self asyncSelect: (self queryArrayByQuerying: queryBlock) offset: offset limit: limit