testing
testJoin
	| talk testDogs selectedDogs testOwners selectedOwners joined |
	talk := self tarantalk.
	testDogs := (talk ensureSpaceNamed: 'trt_testDogs') asDoc.
	[  
	testDogs ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].
	testDogs insert: { 'id' -> 1. 'size'->'large'. 'name'-> 'red'. 'ownerId' -> 1} asDictionary.
	testDogs insert: { 'id' -> 2. 'size'->'small'. 'name'-> 'white'. 'ownerId' -> 2} asDictionary.
	testDogs insert: { 'id' -> 3. 'size'->'medium'. 'name'-> 'blue'. 'ownerId' -> 1} asDictionary.
	(testDogs insert: { 'id' -> 4. 'size'->'medium'. 'name'-> 'white'. 'ownerId' -> 3} asDictionary) sync.
	
	selectedDogs := testDogs selectWhere: [ :each | each id <= 4 ].
	self assert: (selectedDogs size = 4).
	
	testOwners := (talk ensureSpaceNamed: 'trt_testOwners') asDoc.
	testOwners ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].
	testOwners insert: { 'id' -> 1. 'surname'->'suzuki'. 'name' -> 'ichiro'  } asDictionary.
	(testOwners insert: { 'id' -> 2. 'surname'->'yamada'. 'name' -> 'taro'  } asDictionary) sync.
	
	selectedOwners := testOwners selectWhere: [ :each | each id >= 1 ].
	self assert: (selectedOwners size = 2).
	
	joined := testDogs joinTo: testOwners where: [:dog :owner | dog ownerId = owner id].
	self assert: (joined size = 3).
	self assert: ((joined select: [ :each | (each last at: 'name') = 'taro' ]) size = 1).
	self assert: ((joined select: [ :each | (each last at: 'name') = 'ichiro' ]) size = 2).
	
	] ensure: [  
		testDogs drop.
		testOwners drop
	]