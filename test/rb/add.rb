#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
transport.open()
sum = client.add(1,2)
transport.close()
puts sum
