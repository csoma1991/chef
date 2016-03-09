






include_recipe "jenkins::jenkins_installation"
include_recipe "jenkins::proxy"
include_recipe "jenkins::node_installation"
include_recipe "jenkins::mysql"
include_recipe "jenkins::plugins"
include_recipe "jenkins::R"
