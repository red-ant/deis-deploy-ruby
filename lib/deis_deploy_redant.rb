# encoding: UTF-8

require 'deis_deploy_redant/configuration'
require 'deis_deploy_redant/railtie' if defined?(Rails)

module DeisDeployRedant
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Deploy
    def remote_name
      DeisDeployRedant.configuration.remote_name
    end
  end

end
