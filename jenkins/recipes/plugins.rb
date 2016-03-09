

package 'git' do
  action :install
end

bash 'other_configuration' do
  cwd '/tmp'
  code <<-EOH
    pushd /opt
    mkdir -p gimlet daiquiri popd
    chmod a=rwx gimlet daiquiri popd
    pushd /var/log
    mkdir -p gimlet daiquiri mock-server
    chmod a=rwx gimlet daiquiri mock-server
    EOH
end

template 'var/lib/jenkins/.ssh/id_rsa' do
  source 'id_rsa.erb'
  mode '0600'
  owner 'jenkins'
  group 'jenkins'

end
