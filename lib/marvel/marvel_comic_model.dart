class MarvelComics {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? eTag;
  Data? data;

  MarvelComics({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.eTag,
    this.data,
  });

  factory MarvelComics.fromJson(Map<String, dynamic> json) {
    return MarvelComics(
      code: json['code'],
      status: json['status'],
      copyright: json['copyright'],
      attributionText: json['attributionText'],
      attributionHTML: json['attributionHTML'],
      eTag: json['etag'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'etag': eTag,
      'data': data?.toJson(),
    };
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultsComics>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: List<ResultsComics>.from(
        (json['results'] as List).map(
              (result) => ResultsComics.fromJson(result),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results?.map((result) => result.toJson()).toList(),
    };
  }
}

class ResultsComics {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<TextObjects>? textObjects;
  String? resourceURI;
  List<Urls>? urls;
  Series? series;
  List<MyVariants>? variants;
  List<Null>? collections;
  List<Null>? collectedIssues;
  List<Dates>? dates;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List<Images>? images;
  Creators? creators;
  Creators? characters;
  Creators? stories;
  Events? events;

  ResultsComics({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceURI,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory ResultsComics.fromJson(Map<String, dynamic> json) {
    return ResultsComics(
      id: json['id'],
      digitalId: json['digitalId'],
      title: json['title'],
      issueNumber: json['issueNumber'],
      variantDescription: json['variantDescription'],
      description: json['description'],
      modified: json['modified'],
      isbn: json['isbn'],
      upc: json['upc'],
      diamondCode: json['diamondCode'],
      ean: json['ean'],
      issn: json['issn'],
      format: json['format'],
      pageCount: json['pageCount'],
      textObjects: List<TextObjects>.from(
        (json['textObjects'] as List).map(
              (textObject) => TextObjects.fromJson(textObject),
        ),
      ),
      resourceURI: json['resourceURI'],
      urls: List<Urls>.from(
        (json['urls'] as List).map(
              (url) => Urls.fromJson(url),
        ),
      ),
      series: Series.fromJson(json['series']),
      variants: List<MyVariants>.from(
        (json['variants'] as List).map(
              (variant) => MyVariants.fromJson(variant),
        ),
      ),
      collections: List<Null>.from(
        (json['collections'] as List).map(
              (collection) => Null.fromJson(collection),
        ),
      ),
      collectedIssues: List<Null>.from(
        (json['collectedIssues'] as List).map(
              (collectedIssue) => Null.fromJson(collectedIssue),
        ),
      ),
      dates: List<Dates>.from(
        (json['dates'] as List).map(
              (date) => Dates.fromJson(date),
        ),
      ),
      prices: List<Prices>.from(
        (json['prices'] as List).map(
              (price) => Prices.fromJson(price),
        ),
      ),
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
      images: List<Images>.from(
        (json['images'] as List).map(
              (image) => Images.fromJson(image),
        ),
      ),
      creators: Creators.fromJson(json['creators']),
      characters: Creators.fromJson(json['characters']),
      stories: Creators.fromJson(json['stories']),
      events: Events.fromJson(json['events']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified,
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'textObjects': textObjects?.map((textObject) => textObject.toJson()).toList(),
      'resourceURI': resourceURI,
      'urls': urls?.map((url) => url.toJson()).toList(),
      'series': series?.toJson(),
      'variants': variants?.map((variant) => variant.toJson()).toList(),
      'collections': collections?.map((collection) => collection.toJson()).toList(),
      'collectedIssues': collectedIssues?.map((collectedIssue) => collectedIssue.toJson()).toList(),
      'dates': dates?.map((date) => date.toJson()).toList(),
      'prices': prices?.map((price) => price.toJson()).toList(),
      'thumbnail': thumbnail?.toJson(),
      'images': images?.map((image) => image.toJson()).toList(),
      'creators': creators?.toJson(),
      'characters': characters?.toJson(),
      'stories': stories?.toJson(),
      'events': events?.toJson(),
    };
  }
}

class TextObjects {
  String? type;
  String? language;
  String? text;

  TextObjects({
    this.type,
    this.language,
    this.text,
  });

  factory TextObjects.fromJson(Map<String, dynamic> json) {
    return TextObjects(
      type: json['type'],
      language: json['language'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'language': language,
      'text': text,
    };
  }
}

class Urls {
  String? type;
  String? url;

  Urls({
    this.type,
    this.url,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }
}

class Series {
  String? resourceURI;
  String? name;

  Series({
    this.resourceURI,
    this.name,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}

class MyVariants {
  // Propiedades de MyVariants
  MyVariants(); // Constructor de MyVariants

  factory MyVariants.fromJson(Map<String, dynamic> json) {
    return MyVariants();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Null {
  // Propiedades de Null
  Null(); // Constructor de Null

  factory Null.fromJson(Map<String, dynamic> json) {
    return Null();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Dates {
  String? type;
  String? date;

  Dates({
    this.type,
    this.date,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      type: json['type'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'date': date,
    };
  }
}

class Prices {
  String? type;
  double? price;

  Prices({
    this.type,
    this.price,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      type: json['type'],
      price: json['price']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
    };
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      path: json['path'],
      extension: json['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': extension,
    };
  }
}

class Images {
  String? path;
  String? extension;

  Images({
    this.path,
    this.extension,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      path: json['path'],
      extension: json['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': extension,
    };
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

  factory Creators.fromJson(Map<String, dynamic> json) {
    return Creators(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: List<Items>.from((json['items'] as List).map((item) => Items.fromJson(item))),
      returned: json['returned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items?.map((item) => item.toJson()).toList(),
      'returned': returned,
    };
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? role;

  Items({
    this.resourceURI,
    this.name,
    this.role,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      resourceURI: json['resourceURI'],
      name: json['name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
      'role': role,
    };
  }
}

class Events {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Events({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: List<Items>.from((json['items'] as List).map((item) => Items.fromJson(item))),
      returned: json['returned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items?.map((item) => item.toJson()).toList(),
      'returned': returned,
    };
  }
}


// Clases adicionales...


/*class MarvelComicsModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? eTag;
  Data? data;

  MarvelComicsModel(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.eTag,
      this.data});

  MarvelComicsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    eTag = json['etag'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['copyright'] = copyright;
    data['attributionText'] = attributionText;
    data['attributionHTML'] = attributionHTML;
    data['etag'] = eTag;
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
  List<ResultsComics>? results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <ResultsComics>[];
      json['results'].forEach((v) {
        results!.add(ResultsComics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['total'] = total;
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultsComics {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<TextObjects>? textObjects;
  String? resourceURI;
  List<Urls>? urls;
  Series? series;
  List<Variants>? variants;
  List<Null>? collections;
  List<Null>? collectedIssues;
  List<Dates>? dates;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List<Images>? images;
  Creators? creators;
  Creators? characters;
  Creators? stories;
  Events? events;

  ResultsComics(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.textObjects,
      this.resourceURI,
      this.urls,
      this.series,
      this.variants,
      this.collections,
      this.collectedIssues,
      this.dates,
      this.prices,
      this.thumbnail,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});

  ResultsComics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = <TextObjects>[];
      json['textObjects'].forEach((v) {
        textObjects!.add(TextObjects.fromJson(v));
      });
    }
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    if (json['collections'] != null) {
      collections = <Null>[];
      json['collections'].forEach((v) {
        collections!.add(Null.fromJson(v));
      });
    }
    if (json['collectedIssues'] != null) {
      collectedIssues = <Null>[];
      json['collectedIssues'].forEach((v) {
        collectedIssues!.add(Null.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(Dates.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    creators =
        json['creators'] != null ? Creators.fromJson(json['creators']) : null;
    characters = json['characters'] != null
        ? Creators.fromJson(json['characters'])
        : null;
    stories =
        json['stories'] != null ? Creators.fromJson(json['stories']) : null;
    events = json['events'] != null ? Events.fromJson(json['events']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digitalId'] = digitalId;
    data['title'] = title;
    data['issueNumber'] = issueNumber;
    data['variantDescription'] = variantDescription;
    data['description'] = description;
    data['modified'] = modified;
    data['isbn'] = isbn;
    data['upc'] = upc;
    data['diamondCode'] = diamondCode;
    data['ean'] = ean;
    data['issn'] = issn;
    data['format'] = format;
    data['pageCount'] = pageCount;
    if (textObjects != null) {
      data['textObjects'] = textObjects!.map((v) => v.toJson()).toList();
    }
    data['resourceURI'] = resourceURI;
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (collections != null) {
      data['collections'] = collections!.map((v) => v.toJson()).toList();
    }
    if (collectedIssues != null) {
      data['collectedIssues'] =
          collectedIssues!.map((v) => v.toJson()).toList();
    }
    if (dates != null) {
      data['dates'] = dates!.map((v) => v.toJson()).toList();
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
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
    if (events != null) {
      data['events'] = events!.toJson();
    }
    return data;
  }
}

class TextObjects {
  String? type;
  String? language;
  String? text;

  TextObjects({this.type, this.language, this.text});

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['language'] = language;
    data['text'] = text;
    return data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class Series {
  String? resourceURI;
  String? name;

  Series({this.resourceURI, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }
}

class Dates {
  String? type;
  String? date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['date'] = date;
    return data;
  }
}

class Prices {
  String? type;
  double? price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['price'] = price;
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}

class Creators {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Creators({this.available, this.collectionURI, this.items, this.returned});

  Creators.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? role;

  Items({this.resourceURI, this.name, this.role});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['role'] = this.role;
    return data;
  }
}

class ItemsComics {
  String? resourceURI;
  String? name;
  String? type;

  ItemsComics({this.resourceURI, this.name, this.type});

  ItemsComics.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Events {
  int? available;
  String? collectionURI;
  List<Null>? items;
  int? returned;

  Events({this.available, this.collectionURI, this.items, this.returned});

  Events.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Null>[];
      json['items'].forEach((v) {
        items!.add(Null.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}
*/