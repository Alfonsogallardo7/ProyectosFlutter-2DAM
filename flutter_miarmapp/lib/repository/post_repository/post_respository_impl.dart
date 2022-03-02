import 'dart:convert';

import 'package:flutter_miarmapp/models/posts_response.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRespositoryImpl extends PostRepository {
  final Client _client = Client();
  @override
  Future<List<Post>> fetchPosts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString (Constant.token);
    final response = await _client
        .get(Uri.parse('http://10.0.2.2:8080/post/public'), headers: {
      'Authorization':
          'Bearer $token'
    });
    if (response.statusCode == 200) {
      return PostsResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
