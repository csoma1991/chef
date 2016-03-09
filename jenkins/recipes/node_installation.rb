include_recipe 'nodejs::default'

template '/var/lib/jenkins/.npmrc' do
  source 'jenkins_npm.bash.erb'
  mode '0644'
  owner 'jenkins'
  group 'jenkins'
end

template '/home/ubuntu/.npmrc' do
  source 'ubuntu_npm.bash.erb'
  mode '0644'
  owner 'jenkins'
  group 'jenkins'
end

execute 'install_grunt' do
  command 'npm install grunt -g'
end

execute 'install_grunt-cli' do
  command 'npm install grunt-cli -g'
end

template '/etc/maven/m2.conf' do
  source 'm2.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

include_recipe "ark::default"

execute 'update' do
	command 'apt-get update '
end


package ['libicu52', 'libjpeg8','libfontconfig','libwebp5','libssl1.0.0']  do
  action :install
end

ark "phantomjs" do
  url "https://github.com/bprodoehl/phantomjs/releases/download/v2.0.0-20150528/phantomjs-2.0.0-20150528-u1404-x86_64.zip"
  action :install
  append_env_path true
end
