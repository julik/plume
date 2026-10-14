# frozen_string_literal: true

module Plume
	class ColumnType < Node
		token :text_span

		attr :text, Stringy

		def self.new(*, text:, **) = super
		def self.concrete(*, text_span:, **) = super

		def text = (@text == LiteralNil) ? text_span_val : @text

		inspectable def affinity
			# rules found at: https://www.sqlite.org/datatype3.html#determination_of_column_affinity
			# SQLite matches these case-insensitively, but only ever folds ASCII
			type = text.to_s.upcase(:ascii)
			if type.include?("INT") then :INTEGER
			elsif type.include?("CHAR") || type.include?("CLOB") || type.include?("TEXT") then :TEXT
			elsif type.include?("BLOB") then :BLOB
			elsif type.include?("REAL") || type.include?("FLOA") || type.include?("DOUB") then :REAL
			else :ANY
			end
		end
	end
end
