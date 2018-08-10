actions
countWhere: queryBlock
	^ (self asyncCountWhere: queryBlock)
		valueThen: [ :ret | ret ifEmpty: [ 0 ] ifNotEmpty: [ret first]]