import 'dart:convert';

import 'package:flutter_miarmapp/models/me_response.dart';
import 'package:flutter_miarmapp/models/posts_response.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/me_repository/me_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeRespositoryImpl extends MeRepository {
  final Client _client = Client();
  @override
  Future<MeResponse> fetchMe() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString (Constant.token);
    final response = await _client
        .get(Uri.parse('http://10.0.2.2:8080/me'), headers: {
      'Authorization':
          'Bearer $token'
    });
    if (response.statusCode == 200) {
      return MeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load perfil');
    }
  }
}