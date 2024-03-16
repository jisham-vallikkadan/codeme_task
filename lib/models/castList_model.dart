class CastListModel {
  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  CastListModel({this.person, this.character, this.self, this.voice});

  CastListModel.fromJson(Map<String, dynamic> json) {
    person =
    json['person'] != null ? Person.fromJson(json['person']) : null;
    character = json['character'] != null
        ? Character.fromJson(json['character'])
        : null;
    self = json['self'];
    voice = json['voice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    if (character != null) {
      data['character'] = character!.toJson();
    }
    data['self'] = self;
    data['voice'] = voice;
    return data;
  }
}

class Person {
  int? id;
  String? url;
  String? name;
  Country? country;
  String? birthday;
  var deathday;
  String? gender;
  Image? image;
  int? updated;
  Links? lLinks;

  Person(
      {this.id,
        this.url,
        this.name,
        this.country,
        this.birthday,
        this.deathday,
        this.gender,
        this.image,
        this.updated,
        this.lLinks});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    updated = json['updated'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['updated'] = updated;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['timezone'] = timezone;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['original'] = original;
    return data;
  }
}

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Character {
  int? id;
  String? url;
  String? name;
  Image? image;
  Links? lLinks;

  Character({this.id, this.url, this.name, this.image, this.lLinks});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}