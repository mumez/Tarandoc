joining
asyncJoinFor: aSpace to: anotherSpace query: queryArray offset: offset limit: limit
	^ self
		asyncJoinFor: aSpace to: anotherSpace query: queryArray
		setting: [ :opts | 
			offset ifNotNil: [ opts offset: offset ].
			limit ifNotNil: [ opts limit: limit ] ]