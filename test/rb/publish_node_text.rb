#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
item = TextItem.new()
item.id = 1
item.date = Time.now.to_s 
item.text = "This is a publish text item test"
err = client.publish_text_item("mrushton","/home/blogcastr.com/test/blog",item)
puts err
transport.close()
