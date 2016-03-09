#crowd credentials
default['jenkins']['crowd-username'] = 'mixology.team'
default['jenkins']['crowd-password'] = 'OMGiHATEpasswordsSOmuch!1'
default['jenkins']['comix_portal_key'] = 'Z79fVWbqfnd5sYwcDsJ7'

default['jenkins']['jenkins_home'] = '/var/lib/jenkins'

#nodejs attributes
default['nodejs']['repo']      =  'https://deb.nodesource.com/node_4.x'
default['nodejs']['version'] = '4.3.1'

#set java_home manually for now(in the build)
default['jenkins']['java_home'] = '/usr/lib/jvm/java-7-openjdk-amd64/'
