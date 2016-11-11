require 'rake'

RSpec.describe 'deis namespace rake task' do
  describe 'deis:deploy' do
    before(:each) do
      load File.expand_path("../../../lib/tasks/deis.rake", __FILE__)
      Rake::Task.define_task(:environment)
    end

    context 'unconfigured gem' do
      it 'should raise an error if the app url is unconfigured' do
        expect{ Rake::Task['deis:deploy'].invoke }.to raise_error(StandardError, 'Must set billing_app_url in DeisDeployRedant initializer')
      end
    end
  end
end
