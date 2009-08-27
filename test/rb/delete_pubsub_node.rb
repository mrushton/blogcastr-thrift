#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
transport.open()
err = client.delete_pubsub_node("test", "/home/blogcastr.com/test/blog")
puts err
transport.close()
