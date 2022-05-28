// To parse this JSON data, do
//
//     final oneyear = oneyearFromJson(jsonString);

import 'dart:convert';

Oneyear oneyearFromJson(String str) => Oneyear.fromJson(json.decode(str));

String oneyearToJson(Oneyear data) => json.encode(data.toJson());

class Oneyear {
  Oneyear({
    this.data,
    this.meta,
  });

  List<Datumm>? data;
  Meta? meta;

  factory Oneyear.fromJson(Map<String, dynamic> json) => Oneyear(
    data: List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datumm {
  Datumm({
    this.id,
    this.attributes,
  });

  int? id;
  Attributes? attributes;

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
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
    this.year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    year: json["Year"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Year": year,
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
