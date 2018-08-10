instance creation
on: aTrSpace
	| inst |
	inst := self new.
	inst space: aTrSpace.
	inst parent: aTrSpace parent.
	^ inst