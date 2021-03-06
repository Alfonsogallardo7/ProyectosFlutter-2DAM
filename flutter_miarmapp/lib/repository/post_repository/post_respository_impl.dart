import 'dart:convert';

import 'package:flutter_miarmapp/models/new_post_dto.dart';
import 'package:flutter_miarmapp/models/new_post_response.dart';
import 'package:flutter_miarmapp/models/posts_response.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
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

  @override
  Future<NewPostResponse> newPost(NewPostDto newPostDto, String image) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    var uri = Uri.parse('http://10.0.2.2:8080/post/');

    var body = jsonEncode({
      
      'titulo': newPostDto.titulo,
      'texto': newPostDto.texto,
    });

    var request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('newPublicacion', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('file', image,
          contentType: MediaType('multipart', 'form-data')))
      ..headers.addAll(headers);
       final response = await request.send();

    if (response.statusCode == 201) {
      return NewPostResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
