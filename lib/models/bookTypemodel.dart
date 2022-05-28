// To parse this JSON data, do
//
//     final booktype = booktypeFromJson(jsonString);

import 'dart:convert';

Booktype booktypeFromJson(String str) => Booktype.fromJson(json.decode(str));

String booktypeToJson(Booktype data) => json.encode(data.toJson());

class Booktype {
  Booktype({
    this.data,
    this.meta,
  });

  List<Ddatum>? data;
  Meta? meta;

  factory Booktype.fromJson(Map<String, dynamic> json) => Booktype(
    data: List<Ddatum>.from(json["data"].map((x) => Ddatum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Ddatum {
  Ddatum({
    this.id,
    this.attributes,
  });

  int? id;
  Attributes? attributes;

  factory Ddatum.fromJson(Map<String, dynamic> json) => Ddatum(
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
    this.type,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    type: json["Type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Type": type,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
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
