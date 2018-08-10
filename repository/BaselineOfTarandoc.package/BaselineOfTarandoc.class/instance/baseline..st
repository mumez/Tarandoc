baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		
		spec
			package: 'Tarandoc-Core';
			package: 'Tarandoc-Query'.
			
		spec
			group: 'default' with: #('core');
			group: 'core' with: #('Tarandoc-Core' 'Tarandoc-Query') ].