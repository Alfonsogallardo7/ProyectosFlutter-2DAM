class MeResponse {
  MeResponse({
    required this.nombre,
    required this.apellidos,
    required this.username,
    required this.email,
    required this.fotoPerfil,
    required this.rol,
    required this.token,
    required this.privacidad,
    required this.listaPublicaciones,
  });
  late final String nombre;
  late final String apellidos;
  late final String username;
  late final String email;
  late final String fotoPerfil;
  late final String rol;
  late final String token;
  late final String privacidad;
  late final List<ListaPublicaciones> listaPublicaciones;
  
  MeResponse.fromJson(Map<String, dynamic> json){
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    email = json['email'];
    fotoPerfil = json['fotoPerfil'];
    rol = json['rol'];
    token = json['token'];
    privacidad = json['privacidad'];
    listaPublicaciones = List.from(json['listaPublicaciones']).map((e)=>ListaPublicaciones.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombre'] = nombre;
    _data['apellidos'] = apellidos;
    _data['username'] = username;
    _data['email'] = email;
    _data['fotoPerfil'] = fotoPerfil;
    _data['rol'] = rol;
    _data['token'] = token;
    _data['privacidad'] = privacidad;
    _data['listaPublicaciones'] = listaPublicaciones.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ListaPublicaciones {
  ListaPublicaciones({
    required this.id,
    required this.titulo,
    required this.texto,
    required this.fichero,
    required this.privacidad,
    required this.usernameUsuario,
    required this.fotoUsuario,
  });
  late final String id;
  late final String titulo;
  late final String texto;
  late final String fichero;
  late final String privacidad;
  late final String usernameUsuario;
  late final String fotoUsuario;
  
  ListaPublicaciones.fromJson(Map<String, dynamic> json){
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    fichero = json['fichero'];
    privacidad = json['privacidad'];
    usernameUsuario = json['usernameUsuario'];
    fotoUsuario = json['fotoUsuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['texto'] = texto;
    _data['fichero'] = fichero;
    _data['privacidad'] = privacidad;
    _data['usernameUsuario'] = usernameUsuario;
    _data['fotoUsuario'] = fotoUsuario;
    return _data;
  }
}