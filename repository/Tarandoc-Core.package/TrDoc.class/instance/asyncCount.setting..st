counting
asyncCount: queryArray setting: settingsBlock
	| selectFuncPart optionsArray |
	selectFuncPart := 'count(',  (self space fullSafeName),  ',...)'.
	optionsArray :=  (self optionsBySetting: settingsBlock).
	^self evalWithReturn: (self fullFunctionName: selectFuncPart)
		arguments: {queryArray. optionsArray}