selecting
asyncSelect: queryArray setting: settingsBlock
	^self asyncSelect: queryArray options: (self optionsBySetting: settingsBlock)