adding
addComparisonOperator: opNameSymbol with: operandElement
	| operator rightHand |
	operator := TrDocComparisonOperator fromSymbol: opNameSymbol.
	rightHand := operandElement asOperandPhrase.
	^TrDocCondition leftHand: self operator: operator rightHand: rightHand