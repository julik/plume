# frozen_string_literal: true

module Plume
	module Token
		extend Literal::Types
		extend self

		Type = _Union(
			:keyword,
			:identifier,
			:punctuation,
			:string,
			:numeric,
			:blob,
			:true,
			:false,
			:null,
			:current,
			:variable,
		)

		Tuple = _Tuple(_Union(Symbol, _Array(Symbol)), Integer, Integer, Type)

		def Keyword(arg)
			[*arg, :keyword] if arg
		end

		def Identifier(arg)
			[*arg, :identifier] if arg
		end

		def Punctuation(arg)
			[*arg, :punctuation] if arg
		end

		def String(arg)
			[*arg, :string] if arg
		end

		def Numeric(arg)
			[*arg, :numeric] if arg
		end

		def Blob(arg)
			[*arg, :blob] if arg
		end

		def True(arg)
			[*arg, :true] if arg
		end

		def False(arg)
			[*arg, :false] if arg
		end

		def Null(arg)
			[*arg, :null] if arg
		end

		def Current(arg)
			[*arg, :current] if arg
		end

		def Variable(arg)
			[*arg, :variable] if arg
		end

		def source(str, tup)
			return unless str && present?(tup)

			_, beg, fin, = tup

			str.byteslice(beg, (fin - beg))
		end

		def value(str, tup)
			return unless str && present?(tup)

			*, type = tup

			case type
			when :null        then LiteralNil
			when :true        then true
			when :false       then LiteralFalse
			when :current     then source(str, tup).to_sym.upcase
			when :numeric     then numeric_literal(str, tup)
			when :string      then string_literal(str, tup)
			when :blob        then blob_literal(str, tup)
			when :keyword     then source(str, tup)
			when :identifier  then identifier(str, tup)
			when :punctuation then source(str, tup)
			when :variable    then source(str, tup)
			end
		end

		def location(tup)
			return unless present?(tup)

			_, beg, fin, = tup

			[beg, fin].freeze
		end

		def token(tup)
			return unless present?(tup)

			tok, * = tup

			tok
		end

		def ===(other)
			Tuple === other
		end

		private

		def present?(tup) = !(tup.nil? || LiteralNil.equal?(tup))

		def numeric_literal(str, tup)
			tok, * = tup
			src = source(str, tup)
			# A signed number spans the sign too, and whatever spaces or comments follow it
			src = Plume.tokenize(src, with_values: true).last.last if Array === tok
			value = number(src.delete("_"))

			(Array === tok && tok.first == :MINUS) ? -value : value
		end

		# Hex literals are 64-bit two's complement in SQLite, so 0xFFFFFFFFFFFFFFFF is -1
		def number(text)
			if text.start_with?("0x", "0X")
				value = text.byteslice(2..).to_i(16)
				(value >= 2**63 && value < 2**64) ? value - 2**64 : value
			elsif text.include?(".") || text.include?("e") || text.include?("E")
				text.to_f
			else
				text.to_i
			end
		end

		def string_literal(str, tup)
			src = source(str, tup)
			bytesize = src.bytesize
			# strip the leading and trailing quotes, a quote inside is written twice
			src.byteslice(1, bytesize - 2).gsub("''", "'")
		end

		def blob_literal(str, tup)
			src = source(str, tup)
			bytesize = src.bytesize
			# trim the leading /x'/i and trailing /'/ then decode the hexadecimal string
			[src.byteslice(2, bytesize - 3)].pack("H*")
		end

		def identifier(str, tup)
			tok, * = tup

			return string_literal(str, tup) if tok == :STRING

			src = source(str, tup)

			return src if tok != :ID

			# Inside quotes, the quote character itself is written twice. Brackets have no escape
			case src.getbyte(0)
			when 96 then src.byteslice(1, src.bytesize - 2).gsub("``", "`")
			when 39 then src.byteslice(1, src.bytesize - 2).gsub("''", "'")
			when 34 then src.byteslice(1, src.bytesize - 2).gsub('""', '"')
			when 91 then src.byteslice(1, src.bytesize - 2)
			else src
			end
		end
	end
end