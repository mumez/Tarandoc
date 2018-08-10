converting
conditionArray
	^ {self leftHand asDocQueryElement.
	self operator asDocQueryElement.
	self rightHand asDocQueryElement}