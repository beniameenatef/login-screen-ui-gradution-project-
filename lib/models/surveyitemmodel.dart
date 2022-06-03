// To parse this JSON data, do
//
//     final surveyItems = surveyItemsFromJson(jsonString);

import 'dart:convert';

SurveyItems surveyItemsFromJson(String str) => SurveyItems.fromJson(json.decode(str));

String surveyItemsToJson(SurveyItems data) => json.encode(data.toJson());

class SurveyItems {
  SurveyItems({
    this.data,
    this.meta,
  });

  List<Datuum>? data;
  Meta? meta;

  factory SurveyItems.fromJson(Map<String, dynamic> json) => SurveyItems(
    data: List<Datuum>.from(json["data"].map((x) => Datuum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datuum {
  Datuum({
    this.id,
    this.attributes,
  });

  int? id;
  DatumAttributes? attributes;


  factory Datuum.fromJson(Map<String, dynamic> json) => Datuum(
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
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.survey,
  });

  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Survey? survey;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    description: json["Description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    survey: Survey.fromJson(json["survey"]),
  );

  Map<String, dynamic> toJson() => {
    "Description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "survey": survey?.toJson(),


  };
}

class Survey {
  Survey({
    this.data,
  });

  Data? data;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
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
    this.sType,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? sType;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
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
