selecting
asyncSelect: queryArray setting: optionsBlock
	| optionsBuilder |
	optionsBuilder := TrDocOptionsBuilder new.
	optionsBlock value: optionsBuilder.
	^self asyncSelectFor: self space query: queryArray options: optionsBuilder options