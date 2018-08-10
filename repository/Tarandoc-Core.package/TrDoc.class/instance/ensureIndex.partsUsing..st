actions-index
ensureIndex: indexName partsUsing:  partsBlock
	^self ensureIndexNamed: indexName setting: [:opts | opts partsUsing: [:flds | partsBlock value: flds]].