#
# Cookbook Name:: cruby-dev
# Recipe:: dependencies
#
# Copyright 2018, Daniel Ferreira (danieldasilvaferreira@gmail.com)
#
# All rights reserved - Do Not Redistribute

package_names = case node["platform"]
                when "ubuntu", "debian"
                  execute "apt-get update" do
                    ignore_failure true
                    not_if do ::File.exists?("/var/lib/apt/periodic/update-success-stamp") end
                  end
                  %w[autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev
                          zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev]
                when "centos", "fedora", "rhel"
                  %w[gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel
                        gdbm-devel ncurses-devel]
                  when "opensuse"
                    %w[gcc automake gdbm-devel libffi-devel libyaml-devel openssl-devel
                              ncurses-devel readline-devel zlib-devel]
                  end

package_names.each do |pkg_name|
  package pkg_name
end

package "git"
