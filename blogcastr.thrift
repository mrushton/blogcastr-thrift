#!/usr/local/bin/thrift --gen erl --gen rb
///////////////////////////////////////////////////////////////////////////
// blogcastr.thrift: Thrift definition file for ejabberd access. Unfortunately
// Thrift does not support struct inheritance which makes this a little
// messy.
//
// Author: Matt Rushton
// Date: 9/9/09
// Copyright Blogcastr Inc., 2009
///////////////////////////////////////////////////////////////////////////

namespace rb thrift

//user
struct User {
  1:string name,
  2:string account,
  3:string url,
  4:string avatar_url,
}

//text comment 
struct TextComment {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
  4:string text,
}

//image comment 
struct ImageComment {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
  4:string image_url,
}

//text post
struct TextPost {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
  4:string text,
}

//image post
struct ImagePost {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
  4:string image_url,
}

//comment post
struct CommentPost {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
}

//repost
struct Repost {
  1:i32 id,
  2:i32 timestamp,
  3:string medium,
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
	i32 publish_text_post_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:TextPost text_post),
	i32 publish_image_post_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:ImagePost image_post),
	i32 publish_text_comment_post_to_pubsub_node(1:string username, 2:string node, 3:User comment_post_from, 4:CommentPost comment_post, 5:User text_comment_from, 6:TextComment text_comment),
	i32 publish_image_comment_post_to_pubsub_node(1:string username, 2:string node, 3:User comment_post_from, 4:CommentPost comment_post, 5:User image_comment_from, 6:ImageComment image_comment),
	i32 publish_text_repost_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:Repost repost, 5:TextPost text_post),
	i32 publish_image_repost_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:Repost repost, 5:ImagePost image_post),
	i32 publish_text_comment_repost_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:Repost repost, 5:TextComment text_comment, 6:list<User> via),
	i32 publish_image_comment_repost_to_pubsub_node(1:string username, 2:string node, 3:User from, 4:Repost repost, 5:ImageComment image_comment, 6:list<User> via),
        //muc
        i32 create_muc_room(1:string username, 2:string room, 3:string title, 4:string subject),
        i32 destroy_muc_room(1:string room),
        i32 get_num_muc_room_occupants(1:string room),
	i32 send_text_post_to_muc_room(1:string username, 2:string room, 3:User from, 4:TextPost text_post),
	i32 send_image_post_to_muc_room(1:string username, 2:string room, 3:User from, 4:ImagePost image_post),
	i32 send_text_comment_post_to_muc_room(1:string username, 2:string room, 3:User comment_post_from, 4:CommentPost comment_post, 5:User text_comment_from, 6:TextComment text_comment),
	i32 send_image_comment_post_to_muc_room(1:string username, 2:string room, 3:User comment_post_from, 4:CommentPost comment_post, 5:User image_comment_from, 6:ImageComment image_comment),
	i32 send_text_repost_to_muc_room(1:string username, 2:string room, 3:User from, 4:Repost repost, 5:TextPost text_post),
	i32 send_image_repost_to_muc_room(1:string username, 2:string room, 3:User from, 4:Repost repost, 5:ImagePost image_post),
	i32 send_text_comment_repost_to_muc_room(1:string username, 2:string room, 3:User from, 4:Repost repost, 5:TextComment text_comment, 6:list<User> via),
	i32 send_image_comment_repost_to_muc_room(1:string username, 2:string room, 3:User from, 4:Repost repost, 5:ImageComment image_comment, 6:list<User> via),
	//user
	i32 send_text_comment_to_muc_occupant(1:string to, 2:string from_jid, 3:User from, 4:TextComment text_comment),
	i32 send_image_comment_to_muc_occupant(1:string to, 2:string from_jid, 3:User from, 4:ImageComment image_comment),
	//tests
	i32 add(1:i32 x, 2:i32 y),
}
