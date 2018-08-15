testing
testCount
	| talk testShirts selectedShirtsCount |
	talk := self tarantalk.
	testShirts := (talk ensureSpaceNamed: 'trt_testShirtCount') asDoc.
	[  
	testShirts ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].
	testShirts insert: { 'id' -> 1. 'size'->'large'. 'color'-> 'red'. 'props'-> {'tags'->'new'} asDictionary } asDictionary.
	testShirts insert: { 'id' -> 2. 'size'->'small'. 'color'-> 'white'. 'props'-> {'tags'->'new'} asDictionary } asDictionary.
	testShirts insert: { 'id' -> 3. 'size'->'medium'. 'color'-> 'blue'. 'props'-> {'tags'->'used'} asDictionary } asDictionary.
	(testShirts insert: { 'id' -> 4. 'size'->'medium'. 'color'-> 'white'. 'props'-> {'tags'->'new'} asDictionary } asDictionary) sync.
	
	selectedShirtsCount := testShirts countWhere: [ :each | each id < 4 ].
	self assert: (selectedShirtsCount = 3).

	(testShirts insert: { 'id' -> 5. 'size'->'medium'. 'color'-> 'black'. 'props'-> {'tags'->'new'} asDictionary } asDictionary) sync.
	
	selectedShirtsCount := testShirts countWhere: [ :each | each size = 'medium' ].
	self assert: (selectedShirtsCount = 3).
	
	selectedShirtsCount := testShirts countWhere: [ :each | (each size = 'medium') & (each color = 'blue') ].
	self assert: (selectedShirtsCount = 1).
	
	selectedShirtsCount := testShirts countWhere: [ :each | (each props tags = 'new') ].
	self assert: (selectedShirtsCount = 4).
	
	] ensure: [  
		testShirts drop
	]