require_relative "lib/config_helpers"

module Config
	extend ConfigHelpers

	def self.production?
		Config.rack_env == "production"
	end

	def self.development?
		Config.rack_env == "development"
	end

	def self.test?
		Config.rack_env == "test"
	end

	# Mandatory -- An exception is raied for those values when missing.
	# This snippet is based on the UbiCloud config.rb.
	mandatory :database_url, string, clear: true
	mandatory :rack_env, string