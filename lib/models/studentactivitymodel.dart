// To parse this JSON data, do
//
//     final studentActivity = studentActivityFromJson(jsonString);

import 'dart:convert';

StudentActivity studentActivityFromJson(String str) => StudentActivity.fromJson(json.decode(str));

String studentActivityToJson(StudentActivity data) => json.encode(data.toJson());

class StudentActivity {
  StudentActivity({
    this.data,
    this.meta,
  });

  List<DatumSA>? data;
  Meta? meta;

  factory StudentActivity.fromJson(Map<String, dynamic> json) => StudentActivity(
    data: List<DatumSA>.from(json["data"].map((x) => DatumSA.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class DatumSA {
  DatumSA({
    this.id,
    this.attributes,
  });

  int? id;
  DatumAttributes? attributes;

  factory DatumSA.fromJson(Map<String, dynamic> json) => DatumSA(
    id: json["id"],
    attributes: DatumAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DatumAttributes {
  DatumAttributes({
    this.total,
    this.number,
    this.percentage,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.year,
  });

  String? total;
  String? number;
  int? percentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Yearr? year;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    total: json["Total"],
    number: json["Number"],
    percentage: json["Percentage"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    year: Yearr.fromJson(json["Year"]),
  );

  Map<String, dynamic> toJson() => {
    "Total": total,
    "Number": number,
    "Percentage": percentage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "Year": year?.toJson(),
  };
}

class Yearr {
  Yearr({
    this.data,
  });

  Data? data;

  factory Yearr.fromJson(Map<String, dynamic> json) => Yearr(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.attributes,
  });

  int? id;
  DataAttributes? attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    attributes: DataAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DataAttributes {
  DataAttributes({
    this.year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
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
