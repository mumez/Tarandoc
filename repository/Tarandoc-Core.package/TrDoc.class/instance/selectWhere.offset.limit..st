actions
selectWhere: queryBlock offset: offset limit: limit
	^ (self asyncSelectWhere: queryBlock offset: offset limit: limit)
		valueThen: [ :ret | ret ifEmpty: [ #() ] ifNotEmpty: [ ret first ] ]