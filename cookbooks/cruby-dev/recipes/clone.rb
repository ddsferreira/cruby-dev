#
# Cookbook Name:: cruby-dev
# Recipe:: source
#
# Copyright 2018, Daniel Ferreira (danieldasilvaferreira@gmail.com)
#
# All rights reserved - Do Not Redistribute

##
# Setup working directory

directory "/home/ubuntu/src" do
  owner "ubuntu"
  group "ubuntu"
  mode '0755'
end

##
# Checkout cruby master branch from github

git "cruby-source" do
  repository "git://github.com/ruby/ruby.git"
  destination "/home/ubuntu/src"
  # 4e0a512972cdcbfcd5279f1a2a81ba342ed75b6e        refs/tags/v2_5_0
  revision "4e0a512972cdcbfcd5279f1a2a81ba342ed75b6e"
  action :sync
end
