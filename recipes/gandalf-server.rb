include_recipe 'tsuru::repo'

['gandalf-server','archive-server'].each do |pkg|
  package pkg do
    action :nothing
    options '-o Dpkg::Options::="--force-confold"'
  end.run_action(:upgrade)
end

directory '/home/git/bare-template' do
  action :create
  owner 'git'
  group 'git'
  mode 0755
end

directory '/home/git/bare-template/hooks' do
  action :create
  owner 'git'
  group 'git'
  mode 0755
end

cookbook_file '/home/git/bare-template/hooks/pre-receive' do
  action :create
  owner 'git'
  group 'git'
  mode 0755
  source 'pre-receive'
end

template '/etc/gandalf.conf' do
  action :create
  owner 'root'
  group 'root'
  mode 0644
  source 'gandalf.conf.erb'
  variables gandalf: node['gandalf-server']
  notifies :restart, 'service[gandalf-server]'
end

template '/home/git/.bash_profile' do
  action :create_if_missing
  owner 'git'
  group 'git'
  mode 0644
  source 'bash_profile.erb'
  variables tsuru_token: node['gandalf-server']['token'] || `test -x /usr/bin/tsurud && /usr/bin/tsurud token`
  only_if 'test -x /usr/bin/tsurud'
end

['gandalf-server','archive-server'].each do |svc|
  service svc do
    action [:enable, :start]
    provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
  end
end
