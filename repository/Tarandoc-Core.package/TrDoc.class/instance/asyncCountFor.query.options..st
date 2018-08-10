counting
asyncCountFor: aSpace query: queryArray options: optionsArray
	| selectFuncPart |
	selectFuncPart := 'select(',  (aSpace fullSafeName),  ',...)'.
	^self evalWithReturn: (self wrapWithLength: (self fullFunctionName: selectFuncPart))
		arguments: {queryArray. optionsArray}