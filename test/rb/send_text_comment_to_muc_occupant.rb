#!/usr/bin/ruby
require 'thrift'
$:.unshift File.dirname(__FILE__) + "/../../gen-rb"
require 'blogcastr'

socket = Thrift::Socket.new("localhost", 9090)
transport = Thrift::BufferedTransport.new(socket)
transport.open()
protocol = Thrift::BinaryProtocol.new(transport)
client = Thrift::Blogcastr::Client.new(protocol)
thriftUser = Thrift::User.new
thriftUser.name = "Test" 
thriftUser.account = "Blogcastr"
thriftUser.url = "/test" 
thriftUser.avatar_url = "avatar_url"
thriftFrom = Thrift::From.new
thriftFrom.user = thriftUser
thriftFrom.medium = "Test" 
thriftTextComment = Thrift::TextComment.new
thriftTextComment.id = 1
thriftTextComment.from = thriftFrom
thriftTextComment.date = Time.now.to_i
thriftTextComment.text = "This is a test text comment" 
err = client.send_text_comment_to_muc_occupant("arta.blog@conference.blogcastr.com/dashboard", "test@blogcastr.com/blogcastr", thriftTextComment)
puts err
transport.close()
