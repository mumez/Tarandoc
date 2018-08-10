selecting
asyncSelectFor: aSpace query: queryArray options: optionsArray
	| selectFuncPart |
	selectFuncPart := 'select(',  (aSpace fullSafeName),  ',...)'.
	^self evalWithReturn: (self wrapWithToTable: (self fullFunctionName: selectFuncPart))
		arguments: {queryArray. optionsArray}