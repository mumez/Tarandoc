printing
printOn: aStream
	aStream nextPutAll: self className.
	aStream nextPutAll: '('.
	aStream nextPutAll: self queryString.
	aStream nextPutAll: ')'.