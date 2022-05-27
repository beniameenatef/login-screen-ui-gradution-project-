// To parse this JSON data, do
//
//     final astaff = astaffFromJson(jsonString);

import 'dart:convert';

Astaff astaffFromJson(String str) => Astaff.fromJson(json.decode(str));

String astaffToJson(Astaff data) => json.encode(data.toJson());

class Astaff {
  Astaff({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Astaff.fromJson(Map<String, dynamic> json) => Astaff(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.attributes,
  });

  int? id;
  Attributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  Attributes({
    this.name,
    this.job,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.research,
  });

  String? name;
  String? job;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Research? research;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    name: json["Name"],
    job: json["Job"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    research: Research.fromJson(json["research"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Job": job,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "research": research?.toJson(),
  };
}


class Research {
  Research({
    this.data,
  });

  List<dynamic>? data;

  factory Research.fromJson(Map<String, dynamic> json) => Research(
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}

class Meta {
  Meta({
    this.pagination,
  });

  Pagination? pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    pageSize: json["pageSize"],
    pageCount: json["pageCount"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "pageSize": pageSize,
    "pageCount": pageCount,
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}