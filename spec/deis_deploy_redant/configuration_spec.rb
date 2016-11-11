require 'spec_helper'

module DeisDeployRedant
  describe Configuration do
    describe '#remote_name' do
      it 'default value is deis' do
        Configuration.new.remote_name = 'deis'
      end
    end

    describe '#remote_name=' do
      it 'can set value' do
        config = Configuration.new
        config.remote_name = 'other'
        expect(config.remote_name).to eq('other')
      end
    end
  end
end
