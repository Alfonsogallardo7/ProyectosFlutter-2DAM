import 'package:flutter_miarmapp/models/me_response.dart';
import 'package:flutter_miarmapp/models/posts_response.dart';

abstract class MeRepository {
  Future<MeResponse> fetchMe();
}