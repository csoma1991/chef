jenkins_home = node['jenkins']['jenkins_home']
stash_user = node['jenkins']['crowd-username']
stash_password = node['jenkins']['crowd-password']
comix_key = node['jenkins']['comix_portal_key']
java_home= node['jenkins']['java_home']



execute 'update' do
	command 'apt-get update'
end

package "openjdk-7-jdk" do
	action :install
end

include_recipe 'apt::default'

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins-ci.org/debian'
  key 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key'
  components ['binary/']
  action :add
end

package "jenkins" do
	action :install
end

service "jenkins" do
  action [:restart]
end

package 'maven' do
  action :install
end

directory '/var/lib/jenkins/auth' do
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  action :create
end

template '/var/lib/jenkins/auth/comix-portal.key' do
  source 'comix-portal.key.erb'
  mode '0644'
  owner 'jenkins'
  group 'jenkins'
  variables({
     :comix_portal_key => comix_key
  })
end


template '/etc/maven/settings.xml' do
  source 'settings.xml.erb'
  mode '0644'
  owner 'jenkins'
  group 'jenkins'
end


template '/etc/profile.d/jdk.sh' do
  source 'jdk.sh.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
     :java_home => java_home
  })
end


package 'zip' do
	action :install
end

package 'git' do
	action :install
end

git "/tmp/jenkinsbackup" do
  repository "https://#{stash_user}:#{stash_password}@code.bestbuy.com/stash/scm/mix_port/comix-jenkins-backup.git"
  reference "master"
  action :sync
end


bash 'running_restore' do
  cwd '/tmp/jenkinsbackup'
  code <<-EOH
			./restore.sh #{jenkins_home}
	  EOH
	notifies :restart, "service[jenkins]", :immediately
end
