bash 'mysql_install' do
  cwd '/tmp'
  code <<-EOH

apt-get update

MYSQL_PASSWORD="password"
echo "mysql-server mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections
apt-get install -y mysql-server
apt-get install -y mysql-client
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
restart mysql


echo "CREATE DATABASE IF NOT EXISTS daiquiri" | mysql -uroot -p$MYSQL_PASSWORD
echo "GRANT ALL ON daiquiri.* TO 'mysqluser'@'%' IDENTIFIED BY 'userpassword'" | mysql -uroot -p$MYSQL_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_PASSWORD
    EOH
end
