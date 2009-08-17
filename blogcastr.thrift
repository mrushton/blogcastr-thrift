#!/usr/local/bin/thrift --gen erl --gen rb

//text item
struct TextItem {
  1:i32 id,
  2:string date,
  3:string text,
}

service Blogcastr {
	//TODO: use exceptions
	//account management
	i32 create_user(1:string username, 2:string password),
	i32 destroy_user(1:string username),
	string get_user_password(1:string username),
	i32 change_user_password(1:string username, 2:string password),
	//publishing
	i32 create_node(1:string username, 3:string node),
	i32 delete_node(1:string username, 3:string node),
	i32 publish_text_item(1:string username, 2:string node, 3:TextItem item),
	//testing
	i32 add(1:i32 x, 2:i32 y),
}
