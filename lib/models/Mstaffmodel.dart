// To parse this JSON data, do
//
//     final mstaff = mstaffFromJson(jsonString);

import 'dart:convert';

Mstaff mstaffFromJson(String str) => Mstaff.fromJson(json.decode(str));

String mstaffToJson(Mstaff data) => json.encode(data.toJson());

class Mstaff {
  Mstaff({
    this.data,
    this.meta,
  });

  List<Dattum>? data;
  Meta? meta;

  factory Mstaff.fromJson(Map<String, dynamic> json) => Mstaff(
    data: List<Dattum>.from(json["data"].map((x) => Dattum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Dattum {
  Dattum({
    this.id,
    this.attributes,
  });

  int? id;
  Attributes? attributes;

  factory Dattum.fromJson(Map<String, dynamic> json) => Dattum(
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
  });

  String? name;
  String? job;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    name: json["Name"],
    job: json["Job"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Job": job,
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
