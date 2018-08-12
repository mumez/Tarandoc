baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		self tarantalk: spec.
		spec
			package: 'Tarandoc-Core';
			package: 'Tarandoc-Query'.
			
		spec
			group: 'default' with: #('Core');
			group: 'Core' with: #('Tarandoc-Core' 'Tarandoc-Query') ].