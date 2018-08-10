actions
joinTo: anotherDoc where: queryBlock
	^self joinTo: anotherDoc where: queryBlock offset: 0 limit: self stick selectLimit