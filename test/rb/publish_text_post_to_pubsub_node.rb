#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
textPost = TextPost.new()
textPost.id = 1
textPost.date = Time.now.to_s 
textPost.text = "This is a publish text post test"
err = client.publish_text_post("mrushton", "/home/blogcastr.com/mrushton/blog", textPost)
puts err
transport.close()
