selecting
asyncSelect: queryArray offset: offset limit: limit
	^ self
		asyncSelect: queryArray
		setting: [ :opts | 
			offset ifNotNil: [ opts offset: offset ].
			limit ifNotNil: [ opts limit: limit ] ]