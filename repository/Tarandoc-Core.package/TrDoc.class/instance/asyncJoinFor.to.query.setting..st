joining
asyncJoinFor: aSpace to: anotherSpace query: queryArray setting: settingsBlock
	^self asyncJoinFor: self space to: anotherSpace query: queryArray options: (self optionsBySetting: settingsBlock)