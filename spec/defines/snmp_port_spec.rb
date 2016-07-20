require 'spec_helper'

describe 'squid::snmp_port' do
  let :pre_condition do
    ' class{"::squid":
       config => "/tmp/squid.conf"
     }
    '
  end
  let(:title) { '1000' }
  context 'when parameters are unset' do
    it { should contain_concat_fragment('squid_snmp_port_1000').with_target('/tmp/squid.conf') }
    it { should contain_concat_fragment('squid_snmp_port_1000').with_order('40-05') }
    it { should contain_concat_fragment('squid_snmp_port_1000').with_content(/^snmp_port\s+1000\s*$/) }
    it { should contain_concat_fragment('squid_snmp_port_1000').without_content(/^endif$/) }
    it { should contain_concat_fragment('squid_snmp_port_1000').without_content(/^if \${process_number}$/) }
  end
  context 'when parameters are set' do
    let(:params) do
      {
        port: 2000,
        options: 'special for 2000',
        order: '12',
        process_number: 3,
      }
    end
    it { should contain_concat_fragment('squid_snmp_port_2000').with_target('/tmp/squid.conf') }
    it { should contain_concat_fragment('squid_snmp_port_2000').with_order('40-12') }
    it { should contain_concat_fragment('squid_snmp_port_2000').with_content(/^snmp_port\s+2000\s+special for 2000$/) }
    it { should contain_concat_fragment('squid_snmp_port_2000').with_content(/^if \${process_number} = 3$/) }
    it { should contain_concat_fragment('squid_snmp_port_2000').with_content(/^endif$/) }
  end
end
