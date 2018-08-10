actions
joinTo: anotherDoc where: queryBlock offset: offset limit: limit
	^ (self asyncJoinTo:  anotherDoc where: queryBlock offset: offset limit: limit)
		valueThen: [ :ret | ret ifEmpty: [ #() ] ifNotEmpty: [ ret first ] ]