joining
asyncJoinFor: aSpace to: anotherSpace query: queryArray options: optionsArray
	| joinFuncPart |
	joinFuncPart := 'join((',  aSpace fullSafeName,  '),(', anotherSpace fullSafeName, '),...)'.
	^self evalWithReturn: (self wrapWithToTable: (self fullFunctionName: joinFuncPart))
		arguments: {queryArray. optionsArray}