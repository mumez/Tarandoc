actions-index
ensureIndex: indexName partsUsing: partsBlock setting: settingsBlock
	^ self
		ensureIndexNamed: indexName
		setting: [ :opts | 
			opts partsUsing: [ :flds | partsBlock value: flds ].
			settingsBlock value: opts.
			opts ]