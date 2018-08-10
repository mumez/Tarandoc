joining
asyncJoinFor: aSpace to: anotherSpace query: queryArray setting: optionsBlock
	| optionsBuilder |
	optionsBuilder := TrDocOptionsBuilder new.
	optionsBlock value: optionsBuilder.
	^self asyncJoinFor: self space to: anotherSpace query: queryArray options: optionsBuilder options