import 'dart:convert';

import 'package:flutter_assignment/constants/global.dart';
import 'package:flutter_assignment/models/post.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_assignment/services/network.dart';

class Api {
  NetworkLayer networkLayer = NetworkLayer();
  Future<User> getUsers() async {
    User user;

    var response = await networkLayer.get(Paths.user);

    var users = Map<String, dynamic>.from(json.decode(response)['data']);

    users.forEach((key, value) {
      user = User.fromJson(users);
    });

    return user;
  }

  Future<List<Post>> getPosts() async {
    var response = await networkLayer.get(Paths.posts);

    var posts = json.decode(response) as List;

    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
