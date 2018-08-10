selecting
asyncSelectWhere: queryBlock offset: offset limit: limit
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocPhrase.
	^self asyncSelect: builderPhrase queryArray offset: offset limit: limit