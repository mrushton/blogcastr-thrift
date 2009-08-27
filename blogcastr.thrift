#!/usr/local/bin/thrift --gen erl --gen rb

//text post
struct TextPost {
  1:i32 id,
  2:string date,
  3:string text,
}

//image post
struct ImagePost {
  1:i32 id,
  2:string date,
  3:string image_url,
  4:i32 image_width,
  5:i32 image_height,
}

//text comment 
struct TextComment {
  1:i32 id,
  2:string date,
  3:string avatar_url,
  4:string text,
}

//image comment 
struct ImageComment {
  1:i32 id,
  2:string date,
  3:string avatar_url,
  4:string image_url,
  5:i32 image_width,
  6:i32 image_height,
}

//TODO: use exceptions
service Blogcastr {
	//account management
	i32 create_user(1:string username, 2:string password),
	i32 destroy_user(1:string username),
	string get_user_password(1:string username),
	i32 change_user_password(1:string username, 2:string password),
        string get_user_status(1:string username),
        //pubsub
	i32 create_pubsub_node(1:string username, 2:string node),
	i32 destroy_pubsub_node(1:string username, 2:string node),
	i32 subscribe_to_pubsub_node(1:string username, 2:string resource, 3:string node),
	i32 unsubscribe_from_pubsub_node(1:string username, 2:string resource, 3:string node, 4:string sub_id),
	i32 publish_text_post_to_pubsub_node(1:string username, 2:string node, 3:TextPost post),
	i32 publish_image_post_to_pubsub_node(1:string username, 2:string node, 3:ImagePost post),
        //muc
        i32 create_muc_room(1:string username, 2:string room, 3:string title, 4:string subject),
        i32 destroy_muc_room(1:string room),
        i32 get_num_muc_room_occupants(1:string room),
	i32 send_text_post_to_muc_room(1:string username, 2:string room, 3:TextPost post),
	i32 send_image_post_to_muc_room(1:string username, 2:string room, 3:ImagePost post),
	//user
	i32 send_text_comment_to_muc_occupant(1:string to, 2:string from, 3:TextComment comment),
	i32 send_image_comment_to_muc_occupant(1:string to, 2:string from, 3:ImageComment comment),
	//tests
	i32 add(1:i32 x, 2:i32 y),
}
