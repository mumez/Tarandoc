actions
deleteWhere: queryBlock
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocPhrase.
	^self asyncDelete: builderPhrase queryArray