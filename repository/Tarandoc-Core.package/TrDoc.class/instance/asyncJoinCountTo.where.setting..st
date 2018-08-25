joining
asyncJoinCountTo: anotherDoc where: queryBlock setting: settingsBlock
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocQuerySeed new value: TrDocQuerySeed new.
	^ self
		asyncJoinCountFor: self space
		to: anotherDoc space
		query: builderPhrase queryArray
		options: (self optionsBySetting: settingsBlock)