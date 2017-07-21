require 'spec_helper'
describe 'discourse_deploy' do
  context 'with default values for all parameters' do
    it { should contain_class('discourse_deploy') }
  end
end
