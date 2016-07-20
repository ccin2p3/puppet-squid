require 'spec_helper'

describe 'squid::refresh_pattern' do
  let :pre_condition do
    ' class{"::squid":
        config => "/tmp/squid.conf"
      }
    '
  end
  let(:title) { 'myrefresh_pattern' }
  context 'when parameters are set' do
    let(:params) do
      {
        name: 'myrefresh_pattern',
        order: '01',
        options: 'my options for special type'
      }
    end
    it { should contain_concat_fragment('squid_refresh_pattern_myrefresh_pattern').with_target('/tmp/squid.conf') }
    it { should contain_concat_fragment('squid_refresh_pattern_myrefresh_pattern').with_order('50-01') }
    it { should contain_concat_fragment('squid_refresh_pattern_myrefresh_pattern').with_content(%r{^name entries$}) }


  end
end
