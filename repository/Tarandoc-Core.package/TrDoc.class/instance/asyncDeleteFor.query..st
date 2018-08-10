deleting
asyncDeleteFor: aSpace query: queryArray
	| deleteFuncPart |
	deleteFuncPart := 'delete(',  (aSpace fullSafeName),  ',...)'.
	^self evalWithReturn: (self fullFunctionName: deleteFuncPart)
		arguments: {queryArray}