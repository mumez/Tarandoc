inserting
asyncInsertFor: aSpace tuple: aTuple
	| insertFuncPart |
	insertFuncPart := 'insert(',  (aSpace fullSafeName),  ',...)'.
	^self evalWithReturn: (self fullFunctionName: insertFuncPart)
		arguments: {aTuple }