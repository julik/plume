# frozen_string_literal: true

module Plume
	Expression = _Union(
		LiteralValue,
		Token,
		ColumnName,
		TableName,
		_Deferred {
			_Union(
				UnaryExpression,
				BinaryExpression,
				CastExpression,
				TernaryExpression,
				LikeExpression,
				CaseExpression,
				CollationExpression,
				RaiseExpression,
				FunctionReference,
				LiteralExpression,
				ParentheticalExpression,
				SubqueryExpression,
				ExistsExpression,
				Variable,
			)
		},
	)
end
