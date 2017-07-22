require 'spec_helper'
describe 'discourse_deploy' do
  context 'with default values for all parameters' do
    it { should contain_class('discourse_deploy') }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('docker').with(ensure: 'present') } 
    it { is_expected.to contain_file('/var/discourse/containers/app.yml')
        .with(
          :ensure => 'file'
        )
      }
      
  end
end
