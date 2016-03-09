bash 'plugin_install' do
  cwd '/tmp'
  code <<-EOH
	echo "deb http://cran.cnr.Berkeley.edu/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
	gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
	gpg -a --export E084DAB9 | sudo apt-key add -
	apt-get update
    EOH
end

package 'libcurl4-openssl-dev' do
	action :install
end

package 'libxml2-dev' do
	action :install
end

package 'r-base' do
	action :install
end
