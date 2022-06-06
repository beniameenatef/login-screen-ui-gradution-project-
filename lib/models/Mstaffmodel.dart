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
    data: json["data"] == null ? null : List<Dattum>.from(json["data"]?.map((x) => Dattum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta == null ? null : meta!.toJson(),
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
    id: json["id"] == null ? null : json["id"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "attributes": attributes == null ? null : attributes!.toJson(),
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
    name: json["Name"] == null ? null : json["Name"],
    job: json["Job"] == null ? null : json["Job"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name == null ? null : name,
    "Job": job == null ? null : job,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "publishedAt": publishedAt == null ? null : publishedAt!.toIso8601String(),
  };
}

class Meta {
  Meta({
    this.pagination,
  });

  Pagination? pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination == null ? null : pagination!.toJson(),
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
    page: json["page"] == null ? null : json["page"],
    pageSize: json["pageSize"] == null ? null : json["pageSize"],
    pageCount: json["pageCount"] == null ? null : json["pageCount"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "pageSize": pageSize == null ? null : pageSize,
    "pageCount": pageCount == null ? null : pageCount,
    "total": total == null ? null : total,
  };
}
