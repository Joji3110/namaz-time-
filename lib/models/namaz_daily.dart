class NamazWeek {
  String? title;
  String? query;
  int? method;
  String? prayerMethodName;
  String? daylight;
  String? timezone;
  String? mapImage;
  String? sealevel;
  TodayWeather? todayWeather;
  String? link;
  String? qiblaDirection;
  String? latitude;
  String? longitude;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? countryCode;
  List<Items>? items;
  int? statusValid;
  int? statusCode;
  String? statusDescription;

  NamazWeek({
    this.title,
    this.query,
    this.method,
    this.prayerMethodName,
    this.daylight,
    this.timezone,
    this.mapImage,
    this.sealevel,
    this.todayWeather,
    this.link,
    this.qiblaDirection,
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
    this.items,
    this.statusValid,
    this.statusCode,
    this.statusDescription,
  });

  NamazWeek.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    query = json['query'] as String?;
    method = json['method'] as int?;
    prayerMethodName = json['prayer_method_name'] as String?;
    daylight = json['daylight'] as String?;
    timezone = json['timezone'] as String?;
    mapImage = json['map_image'] as String?;
    sealevel = json['sealevel'] as String?;
    todayWeather = (json['today_weather'] as Map<String, dynamic>?) != null
        ? TodayWeather.fromJson(json['today_weather'] as Map<String, dynamic>)
        : null;
    link = json['link'] as String?;
    qiblaDirection = json['qibla_direction'] as String?;
    latitude = json['latitude'] as String?;
    longitude = json['longitude'] as String?;
    address = json['address'] as String;
    city = json['city'] as String?;
    state = json['state'] as String?;
    postalCode = json['postal_code'] as String?;
    country = json['country'] as String?;
    countryCode = json['country_code'] as String?;
    items = (json['items'] as List?)
        ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
        .toList();
    statusValid = json['status_valid'] as int?;
    statusCode = json['status_code'] as int?;
    statusDescription = json['status_description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['query'] = query;
    json['method'] = method;
    json['prayer_method_name'] = prayerMethodName;
    json['daylight'] = daylight;
    json['timezone'] = timezone;
    json['map_image'] = mapImage;
    json['sealevel'] = sealevel;
    json['today_weather'] = todayWeather?.toJson();
    json['link'] = link;
    json['qibla_direction'] = qiblaDirection;
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    json['address'] = address;
    json['city'] = city;
    json['state'] = state;
    json['postal_code'] = postalCode;
    json['country'] = country;
    json['country_code'] = countryCode;
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['status_valid'] = statusValid;
    json['status_code'] = statusCode;
    json['status_description'] = statusDescription;
    return json;
  }
}

class TodayWeather {
  String? pressure;
  String? temperature;

  TodayWeather({
    this.pressure,
    this.temperature,
  });

  TodayWeather.fromJson(Map<String, dynamic> json) {
    pressure = json['pressure'] as String?;
    temperature = json['temperature'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['pressure'] = pressure;
    json['temperature'] = temperature;
    return json;
  }
}

class Items {
  String? dateFor;
  String? fajr;
  String? shurooq;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Items({
    this.dateFor,
    this.fajr,
    this.shurooq,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  Items.fromJson(Map<String, dynamic> json) {
    dateFor = json['date_for'] as String?;
    fajr = json['fajr'] as String?;
    shurooq = json['shurooq'] as String?;
    dhuhr = json['dhuhr'] as String?;
    asr = json['asr'] as String?;
    maghrib = json['maghrib'] as String?;
    isha = json['isha'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['date_for'] = dateFor;
    json['fajr'] = fajr;
    json['shurooq'] = shurooq;
    json['dhuhr'] = dhuhr;
    json['asr'] = asr;
    json['maghrib'] = maghrib;
    json['isha'] = isha;
    return json;
  }
}
