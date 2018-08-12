testing
testSelect
	| talk testShirts selectedShirts |
	talk := self tarantalk.
	testShirts := (talk ensureSpaceNamed: 'trt_testShirts') asDoc.
	[  
	testShirts ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].
	testShirts insert: { 'id' -> 1. 'size'->'large'. 'color'-> 'red'. 'props'-> {'tags'->'new'} asDictionary } asDictionary.
	testShirts insert: { 'id' -> 2. 'size'->'small'. 'color'-> 'white'. 'props'-> {'tags'->'new'} asDictionary } asDictionary.
	testShirts insert: { 'id' -> 3. 'size'->'medium'. 'color'-> 'blue'. 'props'-> {'tags'->'used'} asDictionary } asDictionary.
	(testShirts insert: { 'id' -> 4. 'size'->'medium'. 'color'-> 'white'. 'props'-> {'tags'->'new'} asDictionary } asDictionary) sync.
	
	selectedShirts := testShirts selectWhere: [ :each | each id < 4 ].
	self assert: (selectedShirts size = 3).

	(testShirts insert: { 'id' -> 5. 'size'->'medium'. 'color'-> 'black'. 'props'-> {'tags'->'new'} asDictionary } asDictionary) sync.
	
	selectedShirts := testShirts selectWhere: [ :each | each size = 'medium' ].
	self assert: (selectedShirts size = 3).
	
	selectedShirts := testShirts selectWhere: [ :each | (each size = 'medium') & (each color = 'blue') ].
	self assert: (selectedShirts size = 1).
	
	selectedShirts := testShirts selectWhere: [ :each | (each props tags = 'new') ].
	self assert: (selectedShirts size = 4).
	
	] ensure: [  
		testShirts drop
	]