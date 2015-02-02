#
# Cookbook Name:: chef-consul/
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "consul::default"
include_recipe "consul::ui"

consul_service_def 'voice1' do
  port 5060
  tags ['_sip._udp']
  check(
    interval: '10s',
    script: 'echo ok'
  )
  notifies :reload, 'service[consul]'
end
