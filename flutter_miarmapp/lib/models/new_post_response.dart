class NewPostResponse {
  NewPostResponse({
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
  
  NewPostResponse.fromJson(Map<String, dynamic> json){
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