actions-index
asyncCreateIndexFor: aSpace named: indexName setting: creationSettingsBlock
	| optionsBuilder indexFuncPart |
	optionsBuilder := self indexCreationOptionsBuilder.
	creationSettingsBlock value: optionsBuilder.
	indexFuncPart := 'create_index(',  (aSpace fullSafeName),  ',...)'.
	^self evalWithReturn: (self fullFunctionName: indexFuncPart)
		arguments: {indexName. optionsBuilder options }