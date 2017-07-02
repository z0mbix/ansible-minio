describe file('/usr/local/bin/minio') do
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0755' }
end

describe file('/usr/local/bin/mc') do
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0755' }
end

describe user('minio') do
  it { should exist }
  its('group') { should eq 'minio' }
  its('groups') { should eq ['minio'] }
  its('home') { should eq '/home/minio' }
  its('shell') { should eq '/usr/sbin/nologin' }
end

describe group('minio') do
  it { should exist }
end

describe systemd_service('minio') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(9000) do
  it { should be_listening }
  its('protocols') { should eq ['tcp6'] }
  its('processes') { should include 'minio' }
end

describe parse_config_file('/etc/default/minio') do
  its('MINIO_VOLUMES') { should eq '"/data/minio"' }
end
