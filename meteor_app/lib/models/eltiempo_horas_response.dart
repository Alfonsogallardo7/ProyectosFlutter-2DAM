class PorHorasResponse {
  PorHorasResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
  });
  late final dynamic lat;
  late final dynamic lon;
  late final String? timezone;
  late final dynamic timezoneOffset;
  late final Current current;
  late final List<Hourly> hourly;
  
  PorHorasResponse.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = Current.fromJson(json['current']);
    hourly = List.from(json['hourly']).map((e)=>Hourly.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current.toJson();
    _data['hourly'] = hourly.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });
  late final dynamic dt;
  late final dynamic sunrise;
  late final dynamic sunset;
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic pressure;
  late final dynamic humidity;
  late final dynamic dewPoint;
  late final dynamic uvi;
  late final dynamic clouds;
  late final dynamic visibility;
  late final dynamic windSpeed;
  late final dynamic windDeg;
  late final dynamic windGust;
  late final List<Weather> weather;
  
  Current.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final dynamic id;
  late final String? main;
  late final String? description;
  late final String? icon;
  
  Weather.fromJson(Map<String, dynamic> json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });
  late final dynamic dt;
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic pressure;
  late final dynamic humidity;
  late final dynamic? dewPoint;
  late final dynamic? uvi;
  late final dynamic clouds;
  late final dynamic visibility;
  late final dynamic windSpeed;
  late final dynamic windDeg;
  late final dynamic windGust;
  late final List<Weather> weather;
  late final dynamic pop;
  
  Hourly.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
    pop = json['pop'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    _data['pop'] = pop;
    return _data;
  }
}