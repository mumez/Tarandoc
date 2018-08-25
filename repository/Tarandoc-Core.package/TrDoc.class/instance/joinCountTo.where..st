actions
joinCountTo: anotherDoc where: queryBlock
	^ (self asyncJoinCountTo:  anotherDoc where: queryBlock setting: [:opts | ])
		valueThen: [ :ret | ret ifEmpty: [ #() ] ifNotEmpty: [ ret first ] ]