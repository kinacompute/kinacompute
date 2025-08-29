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

	# Optional -- Value is set to 'nil' if it isn't set.
	optional :app_name, string
	optional :versioning_default, string
	optional :heartbeat_url, string

	optional :auth_github_id, string, clear: true
	optional :auth_github_secret, string, clear: true
	optional :auth_google_id, string, clear: true
	optional :auth_google_secret, string, clear: true

	# Override -- The value is returned or set default.
	override :base_url, "http://localhost:4031", string
	override :database_timeout, 10, int
	override :db_pool, 5, int
	override :deployment, "development", string
	override :port, 3000, int

	override :dispatcher_max_threads, 8, int
	override :dispatcher_min_threads, 1, int

	override :minimum_invoice_charge_threshold, 0.5, float

	# TODO: Add boot images, the default one.
	# And add the images regarding buckers, endpoints, access keys
	# secret keys etc.

	# We also need to add the ubuntu, and other distro images within this
	# configuration file.