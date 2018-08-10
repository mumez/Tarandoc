counting
asyncCount: queryArray setting: optionsBlock
	| optionsBuilder |
	optionsBuilder := TrDocOptionsBuilder new.
	optionsBlock value: optionsBuilder.
	^self asyncCountFor: self space query: queryArray options: optionsBuilder options