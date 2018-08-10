actions-index
ensureIndexFor: aSpace named: indexName setting: creationSettingsBlock
	^ (self
		asyncCreateIndexFor: aSpace named: indexName
		setting: [ :opts | 
			opts ifDuplicateUse: true.
			creationSettingsBlock cull: opts ])
		valueThen: [ :ret | ret ]