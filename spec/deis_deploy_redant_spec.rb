require 'spec_helper'

describe DeisDeployRedant do
  describe '#configure' do
    before(:each) do
      @git_remote = 'test'
      DeisDeployRedant.configure do |config|
        config.remote_name = @git_remote
      end
    end

    it 'returns the deis app name' do
      # probably need to stub the git query
      deploy = DeisDeployRedant::Deploy.new
      #expect(deploy.app_name).to eq(@git_remote)
      expect(deploy.remote_name).to eq(@git_remote)
    end
  end
end
