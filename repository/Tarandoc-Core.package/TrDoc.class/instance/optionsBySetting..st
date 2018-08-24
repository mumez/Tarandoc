private
optionsBySetting: settingsBlock
	| optionsBuilder |
	optionsBuilder := self queryOptionsBuilder.
	settingsBlock value: optionsBuilder.
	^optionsBuilder options