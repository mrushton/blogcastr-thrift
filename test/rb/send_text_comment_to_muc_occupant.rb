#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
textComment = TextComment.new()
textComment.id = 1
textComment.date = Time.now.to_s 
textComment.text = "This is a send text comment to muc occupant test"
err = client.send_text_comment_to_muc_occupant("arta.blog@conference.blogcastr.com/dashboard", "test@blogcastr.com/blogcastr", textComment)
puts err
transport.close()
