#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Blogcastr::Client.new(protocol)
imagePost = ImagePost.new()
imagePost.id = 1
imagePost.date = Time.now.to_s 
imagePost.image_url = "http://blogcastr.com/public/image/test.png"
err = client.send_image_post_to_muc_room("mrushton", "mrushton.blog", imagePost)
puts err
transport.close()
