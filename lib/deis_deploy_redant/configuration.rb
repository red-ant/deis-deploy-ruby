module DeisDeployRedant

  class Configuration
    attr_accessor :remote_name
    attr_accessor :billing_app_url
    attr_accessor :deploy_message_merges

    def initialize
      @remote_name = 'deis'
      @billing_app_url = ''
      @deploy_message_merges = true
    end
  end

end
