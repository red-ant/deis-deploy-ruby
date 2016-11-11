require 'deis_deploy_redant'
require 'rails'

module DeisDeployRedant
  class Railtie < Rails::Railtie
    railtie_name :deis_deploy_redant

    rake_tasks do
      load 'tasks/deis.rake'
    end
  end
end
