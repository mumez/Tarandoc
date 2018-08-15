private
optionsBySetting: settingsBlock
	| optionsBuilder |
	optionsBuilder := TrDocOptionsBuilder new.
	settingsBlock value: optionsBuilder.
	^optionsBuilder options