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