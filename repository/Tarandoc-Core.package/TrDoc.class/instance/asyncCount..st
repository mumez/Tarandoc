counting
asyncCount: queryArray
	^ self
		asyncCount: queryArray
		setting: [ :opts |  ]