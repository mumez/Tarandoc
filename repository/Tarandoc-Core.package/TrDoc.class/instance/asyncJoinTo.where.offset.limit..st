joining
asyncJoinTo: anotherDoc where: queryBlock offset: offset limit: limit
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocQuerySeed new value: TrDocQuerySeed new.
	^self asyncJoinTo: anotherDoc query: builderPhrase queryArray offset: offset limit: limit