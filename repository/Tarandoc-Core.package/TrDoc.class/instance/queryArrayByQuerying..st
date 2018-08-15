private
queryArrayByQuerying: queryBlock
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocPhrase.
	^builderPhrase queryArray