require 'spec_helper'

describe 'squid::logformat' do
  let :pre_condition do
    ' class{"::squid":
        config => "/tmp/squid.conf"
      }
    '
  end
  let(:title) { 'mylogformat' }
  context 'when parameters are set' do
    let(:params) do
      {
        name: 'mylogformat',
        order: '11',
        options: 'my options for special type'
      }
    end
    it { should contain_concat_fragment('squid_logformat_mylogformat').with_target('/tmp/squid.conf') }
    it { should contain_concat_fragment('squid_logformat_mylogformat').with_order('50-11') }
    it { should contain_concat_fragment('squid_logformat_mylogformat').with_content(%r{^name options$}) }


  end
end
