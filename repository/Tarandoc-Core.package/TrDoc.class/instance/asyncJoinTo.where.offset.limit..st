joining
asyncJoinTo: anotherDoc where: queryBlock offset: offset limit: limit
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocPhrase value: TrDocPhrase.
	^self asyncJoinTo: anotherDoc query: builderPhrase queryArray offset: offset limit: limit