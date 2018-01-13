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
  repository "git://github.com/dsferreira/ruby.git"
  destination "/home/ubuntu/src/cruby"
  revision "trunk"
  user "ubuntu"
  group "ubuntu"
  action :checkout
end

##
# Checkout "v2_5_0" tag into "development" branch

bash 'checkout_development_branch' do
  cwd "/home/ubuntu/src/cruby"
  user "ubuntu"
  code <<-EOH
    git checkout -b development v2_5_0
  EOH
  not_if "git branch | grep development", :cwd => "/home/ubuntu/src/cruby"
end
