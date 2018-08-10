printing
queryString
	^String streamContents: [ :str | self printQueryOn: str ]