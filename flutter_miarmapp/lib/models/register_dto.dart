class RegisterDto {
  String? nombre;
  String? apellidos;
  String? email;
  String? password;
  String? password2;
  String? username;
  String? fechaNacimiento;

  RegisterDto(
      {this.nombre,
      this.apellidos,
      this.email,
      this.password,
      this.password2,
      this.username,
      this.fechaNacimiento});

  RegisterDto.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    email = json['email'];
    password = json['password'];
    password2 = json['password2'];
    username = json['username'];
    fechaNacimiento = json['fechaNacimiento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['apellidos'] = apellidos;
    data['email'] = email;
    data['password'] = password;
    data['password2'] = password2;
    data['username'] = username;
    data['fechaNacimiento'] = fechaNacimiento;
    return data;
  }
}
