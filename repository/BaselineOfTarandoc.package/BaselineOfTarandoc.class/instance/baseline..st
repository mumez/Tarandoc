baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		self tarantalk: spec.
		spec
			package: 'Tarandoc-Core';
			package: 'Tarandoc-Query'.
		spec
			package: 'Tarandoc-Tests'.
			
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Tarandoc-Core' 'Tarandoc-Query');
			group: 'Tests' with: #('Tarandoc-Tests') ].