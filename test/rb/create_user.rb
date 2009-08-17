#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
err = client.create_user("mrushton2","password")
transport.close()
puts err
