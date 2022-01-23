class LocationResponse {
  LocationResponse({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<Location> results;
  
  LocationResponse.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    results = List.from(json['results']).map((e)=>Location.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info.toJson();
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
     this.prev,
  });
  late final int count;
  late final int pages;
  late final String next;
  late final Null prev;
  
  Info.fromJson(Map<String, dynamic> json){
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['pages'] = pages;
    _data['next'] = next;
    _data['prev'] = prev;
    return _data;
  }
}

class Location {
  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String dimension;
  late final List<String> residents;
  late final String url;
  late final String created;
  
  Location.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = List.castFrom<dynamic, String>(json['residents']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['dimension'] = dimension;
    _data['residents'] = residents;
    _data['url'] = url;
    _data['created'] = created;
    return _data;
  }
}