selecting
asyncSelectApplying: funcName query: queryArray options: optionsArray
	| selectFuncPart |
	selectFuncPart := 'select(',  (self space fullSafeName),  ',...)'.
	^self evalWithReturn: (self wrapBy: funcName expression: (self fullFunctionName: selectFuncPart))
		arguments: {queryArray. optionsArray}