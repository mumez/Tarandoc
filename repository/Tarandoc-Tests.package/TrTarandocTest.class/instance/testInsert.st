testing
testInsert
	| talk testShirts selectedShirts |
	talk := self tarantalk.
	testShirts := (talk ensureSpaceNamed: 'trt_testShirtsInsert') asDoc.
	[  
	testShirts ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].
	testShirts insert: { 'id' -> 1. 'size'->'large'. 'color'-> 'red'} asDictionary.
	testShirts insert: { 'id' -> 2. 'size'->'small'. 'color'-> 'white'} asDictionary.
	testShirts insert: { 'id' -> 3. 'size'->'medium'. 'color'-> 'blue'} asDictionary.
	(testShirts insert: { 'id' -> 4. 'size'->'medium'. 'color'-> 'white'} asDictionary) sync.
	
	selectedShirts := testShirts selectWhere: [ :each | each id > 0 ].
	self assert: (selectedShirts size = 4).
	
	testShirts insert: { 'id' -> 1. 'size'->'medium'. 'color'-> 'red'.} asDictionary.
	testShirts insert: { 'id' -> 2. 'size'->'medium'. 'color'-> 'white'} asDictionary.
	testShirts insert: { 'id' -> 3. 'size'->'medium'. 'color'-> 'blue'} asDictionary.
	testShirts insert: { 'id' -> 4. 'size'->'medium'. 'color'-> 'white'} asDictionary.
	(testShirts insert: { 'id' -> 5. 'size'->'medium'. 'color'-> 'black'} asDictionary) sync.
	
	selectedShirts := testShirts selectWhere: [ :each | each id > 0 ].
	self assert: (selectedShirts size = 5).
	
	] ensure: [  
		testShirts drop
	]