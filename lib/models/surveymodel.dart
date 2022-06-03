// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);

import 'dart:convert';

Surveys surveyFromJson(String str) => Surveys.fromJson(json.decode(str));

String surveyToJson(Surveys data) => json.encode(data.toJson());

class Surveys {
  Surveys({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Surveys.fromJson(Map<String, dynamic> json) => Surveys(
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
    this.sType,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? sType;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    sType: json["sType"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "sType": sType,
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
