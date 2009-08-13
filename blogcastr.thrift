#!/usr/local/bin/thrift --gen erl --gen rb

//item types
enum ItemType {
  TEXT,
  IMAGE,
  VIDEO, 
}

//item to be published
struct Item {
  1: ItemType type,
  2: string title,
  3: optional string text,
  4: optional string image_url,
  5: optional string video_url,
}

service Blogcastr {
	//TODO: use excpetions instead of return values
	//account management
	i32 create_user(1:string username, 2:string password),
	i32 destroy_user(1:string username),
	i32 change_user_password(1:string username, 2:string password),
	//publishing
	i32 create_node(1:string username, 3:string node),
	i32 destroy_node(1:string username, 3:string node),
	i32 publish_item(1:string username, 2:Item item, 3:string node),
	//testing
	i32 add(1:i32 x, 2:i32 y),
}
