# frozen_string_literal: true

module Plume
	# Shared by INSERT and UPDATE: the `OR …` part of `INSERT OR REPLACE`, and REPLACE on its own
	module ConflictResolution
		TOKEN_TO_RESOLUTION = {
			[:INSERT, :OR, :ROLLBACK].freeze => :ROLLBACK,
			[:INSERT, :OR, :ABORT].freeze    => :ABORT,
			[:INSERT, :OR, :FAIL].freeze     => :FAIL,
			[:INSERT, :OR, :IGNORE].freeze   => :IGNORE,
			[:INSERT, :OR, :REPLACE].freeze  => :REPLACE,
			[:UPDATE, :OR, :ROLLBACK].freeze => :ROLLBACK,
			[:UPDATE, :OR, :ABORT].freeze    => :ABORT,
			[:UPDATE, :OR, :FAIL].freeze     => :FAIL,
			[:UPDATE, :OR, :IGNORE].freeze   => :IGNORE,
			[:UPDATE, :OR, :REPLACE].freeze  => :REPLACE,
			:REPLACE                         => :REPLACE,
		}.freeze
	end
end
