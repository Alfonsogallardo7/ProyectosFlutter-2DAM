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
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJjMGE4MDE0NC03ZjQxLTFhZjktODE3Zi00MWFmZTZkNDAwMDAiLCJpYXQiOjE2NDYxNjA5MjQsIm5vbWJyZSI6IkFsZm9uc28iLCJhcGVsbGlkb3MiOiJHYWxsYXJkbyBSb2Ryw61ndWV6Iiwicm9sZSI6IlVTVUFSSU8ifQ.hu9ErAVhyJp5p3fVPkhYxCft6oYFbRDO1T7DXoXubSVYUW_buv1jMmL_5wC2yi5t'
    });
    if (response.statusCode == 200) {
      return PostsResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
