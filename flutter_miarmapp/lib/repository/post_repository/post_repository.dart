import 'package:flutter_miarmapp/models/new_post_dto.dart';
import 'package:flutter_miarmapp/models/new_post_response.dart';
import 'package:flutter_miarmapp/models/posts_response.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<NewPostResponse> newPost (NewPostDto newPost, String imagePath);
}