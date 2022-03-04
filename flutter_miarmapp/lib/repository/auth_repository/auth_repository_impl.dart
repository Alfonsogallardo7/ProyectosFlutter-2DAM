import 'dart:convert';

import 'package:flutter_miarmapp/models/login_response.dart';
import 'package:flutter_miarmapp/models/register_dto.dart';
import 'package:flutter_miarmapp/models/register_response.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token'
    };

    final response = await _client.post(
        Uri.parse('http://10.0.2.2:8080/auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }

    
  }
  @override
  Future<RegisterResponse> register(RegisterDto registerDto, String image) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    var uri = Uri.parse('http://10.0.2.2:8080/auth/register');

    var body = jsonEncode({
      
      'nombre': registerDto.nombre,
      'apellidos': registerDto.apellidos,
      'email': registerDto.email,
      'password': registerDto.password,
      'password2': registerDto.password2,
      'username': registerDto.username,
      'fechaNacimiento': registerDto.fechaNacimiento,
    });

    var request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('nuevoUsuario', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('file', image,
          contentType: MediaType('multipart', 'form-data')))
      ..headers.addAll(headers);
       final response = await request.send();

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to register');
    }
  } 
}
