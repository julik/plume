# frozen_string_literal: true

module Plume
	class NotLikeExpression < LikeExpression
		def operator = :NOT_LIKE
	end
end
