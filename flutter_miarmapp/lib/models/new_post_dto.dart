class NewPostDto {
  NewPostDto({
    required this.titulo,
    required this.texto,
  });
  late final String titulo;
  late final String texto;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['titulo'] = titulo;
    _data['texto'] = texto;
    return _data;
  }
}