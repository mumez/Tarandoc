private
queryArrayByQuerying: queryBlock
	| builderPhrase |
	builderPhrase := queryBlock value: TrDocQuerySeed new.
	^builderPhrase queryArray