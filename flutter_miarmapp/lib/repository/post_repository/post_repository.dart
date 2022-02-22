import 'package:flutter_miarmapp/models/posts_response.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts(String type);
}