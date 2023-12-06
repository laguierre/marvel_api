class MarvelSeries {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  Data? data;

  MarvelSeries({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  });

  factory MarvelSeries.fromJson(Map<String, dynamic>? json) {
    return MarvelSeries(
      code: json?['code'] as int?,
      status: json?['status'] as String?,
      copyright: json?['copyright'] as String?,
      attributionText: json?['attributionText'] as String?,
      attributionHTML: json?['attributionHTML'] as String?,
      etag: json?['etag'] as String?,
      data: json?['data'] != null ? Data.fromJson(json?['data'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'etag': etag,
    };
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Results>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic>? json) {
    return Data(
      offset: json?['offset'] as int?,
      limit: json?['limit'] as int?,
      total: json?['total'] as int?,
      count: json?['count'] as int?,
      results: json?['results'] != null
          ? List<Results>.from((json!['results'] as List<dynamic>?)
          ?.map((x) => Results.fromJson(x as Map<String, dynamic>)) ?? [])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
    };
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  List<Urls>? urls;
  int? startYear;
  int? endYear;
  String? rating;
  String? type;
  String? modified;
  Thumbnail? thumbnail;
  Creators? creators;
  Creators? characters;
  Creators? stories;
  Creators? comics;
  Creators? events;
  Items? next;
  Items? previous;

  Results({
    this.id,
    this.title,
    this.description,
    this.resourceURI,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  factory Results.fromJson(Map<String, dynamic>? json) {
    return Results(
      id: json?['id'],
      title: json?['title'],
      description: json?['description'],
      resourceURI: json?['resourceURI'],
      urls: json?['urls'] != null
          ? List<Urls>.from(
              (json!['urls'] as List<dynamic>).map((x) => Urls.fromJson(x)))
          : null,
      startYear: json?['startYear'],
      endYear: json?['endYear'],
      rating: json?['rating'],
      type: json?['type'],
      modified: json?['modified'],
      thumbnail: json?['thumbnail'] != null
          ? Thumbnail.fromJson(json!['thumbnail'])
          : null,
      creators: json?['creators'] != null
          ? Creators.fromJson(json!['creators'])
          : null,
      characters: json?['characters'] != null
          ? Creators.fromJson(json!['characters'])
          : null,
      stories:
          json?['stories'] != null ? Creators.fromJson(json!['stories']) : null,
      comics:
          json?['comics'] != null ? Creators.fromJson(json!['comics']) : null,
      events:
          json?['events'] != null ? Creators.fromJson(json!['events']) : null,
      next: json?['next'] != null ? Items.fromJson(json!['next']) : null,
      previous:
          json?['previous'] != null ? Items.fromJson(json!['previous']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'description': description,
      'resourceURI': resourceURI,
      'startYear': startYear,
      'endYear': endYear,
      'rating': rating,
      'type': type,
      'modified': modified,
    };
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (creators != null) {
      data['creators'] = creators!.toJson();
    }
    if (characters != null) {
      data['characters'] = characters!.toJson();
    }
    if (stories != null) {
      data['stories'] = stories!.toJson();
    }
    if (comics != null) {
      data['comics'] = comics!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    if (next != null) {
      data['next'] = next!.toJson();
    }
    if (previous != null) {
      data['previous'] = previous!.toJson();
    }
    return data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({
    this.type,
    this.url,
  });

  factory Urls.fromJson(Map<String, dynamic>? json) {
    return Urls(
      type: json?['type'],
      url: json?['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'type': type,
      'url': url,
    };
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic>? json) {
    return Thumbnail(
      path: json?['path'],
      extension: json?['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'path': path,
      'extension': extension,
    };
    return data;
  }
}

class Creators {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Creators({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic>? json) {
    return Creators(
      available: json?['available'],
      collectionURI: json?['collectionURI'],
      items: json?['items'] != null
          ? List<Items>.from(
              (json!['items'] as List<dynamic>).map((x) => Items.fromJson(x)))
          : null,
      returned: json?['returned'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'available': available,
      'collectionURI': collectionURI,
      'returned': returned,
    };
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? role;
  String? type;

  Items({
    this.resourceURI,
    this.name,
    this.role,
    this.type,
  });

  factory Items.fromJson(Map<String, dynamic>? json) {
    return Items(
      resourceURI: json?['resourceURI'],
      name: json?['name'],
      role: json?['role'],
      type: json?['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'resourceURI': resourceURI,
      'name': name,
      'role': role,
      'type': type,
    };
    return data;
  }
}
