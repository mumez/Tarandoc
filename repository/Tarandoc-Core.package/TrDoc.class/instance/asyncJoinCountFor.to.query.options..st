joining
asyncJoinCountFor: aSpace to: anotherSpace query: queryArray options: optionsArray
	| joinFuncPart |
	joinFuncPart := 'join_count((',  aSpace fullSafeName,  '),(', anotherSpace fullSafeName, '),...)'.
	^self evalWithReturn: (self fullFunctionName: joinFuncPart)
		arguments: {queryArray. optionsArray}