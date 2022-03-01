import 'dart:convert';

import 'package:flutter_miarmapp/models/posts_response.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';
import 'package:http/http.dart';

class PostRespositoryImpl extends PostRepository {
  final Client _client = Client();
  @override
  Future<List<Post>> fetchPosts() async {
    final response = await _client
        .get(Uri.parse('http://10.0.2.2:8080/post/public'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYzFiMDJiZi03ZjQ1LTE5OGEtODE3Zi00NTZhMmVkNzAwMDAiLCJpYXQiOjE2NDYyMjM0NjQsIm5vbWJyZSI6Ik1pZ3VlbCIsImFwZWxsaWRvcyI6IkNhbXBvcyBSaXZlcmEiLCJyb2xlIjoiVVNVQVJJTyJ9.nwYIEZxjkUVoNfx6fZtXojJH_4OVWq5H5T7UWWErwVctKFFQ-jrQjgWf_XMdEmGV'
    });
    if (response.statusCode == 200) {
      return PostsResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
