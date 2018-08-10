counting
asyncCountWhere: queryBlock
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocPhrase.
	^self asyncCount: builderPhrase queryArray