include_recipe 'tsuru::repo'

package 'node-hipache' do
  action :install
end

directory node['hipache']['server']['accessLog'].gsub(/\/[^\/]+$/,'') do
  action :create
  owner node['hipache']['user']
  recursive true
end

file '/etc/hipache.conf' do
  action :create
  owner 'root'
  mode 0644
  content JSON.pretty_generate(node['hipache'])
  notifies :restart, 'service[hipache]'
end

service 'hipache' do
  action :nothing
  provider Chef::Provider::Service::Upstart
end
