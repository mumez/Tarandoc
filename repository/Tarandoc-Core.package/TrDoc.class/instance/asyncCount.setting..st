counting
asyncCount: queryArray setting: settingsBlock
	^self asyncSelectApplying: 'length' query: queryArray options: (self optionsBySetting: settingsBlock)