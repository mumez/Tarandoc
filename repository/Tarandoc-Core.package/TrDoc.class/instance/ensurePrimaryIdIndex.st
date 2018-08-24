actions-index
ensurePrimaryIdIndex
	^ self ensurePrimaryIndexWithPartsUsing: [ :flds | flds unsignedNamed: 'id' ].