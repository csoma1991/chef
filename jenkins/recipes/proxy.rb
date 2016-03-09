include_recipe "nginx::repo"
include_recipe "nginx::default"


nginx_site '000-default' do
  enable false
end

nginx_site 'comix.jenkins.local' do
  template 'nginx.conf.erb'
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
  notifies :reload, 'service[nginx]', :delayed
end

file '/etc/nginx/conf.d/example_ssl.conf' do
  action :delete
  notifies :reload, 'service[nginx]', :delayed
end
