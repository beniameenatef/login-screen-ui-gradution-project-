// To parse this JSON data, do
//
//     final lab = labFromJson(jsonString);

import 'dart:convert';

Lab labFromJson(String str) => Lab.fromJson(json.decode(str));

String labToJson(Lab data) => json.encode(data.toJson());

class Lab {
  Lab({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
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
  DatumAttributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    this.pCnumber,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.labNumber,
    this.mid,
  });

  String? pCnumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? labNumber;
  Mid? mid;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    pCnumber: json["PCnumber"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    labNumber: json["LabNumber"],
    mid: Mid.fromJson(json["MID"]),
  );

  Map<String, dynamic> toJson() => {
    "PCnumber": pCnumber,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "LabNumber": labNumber,
    "MID": mid?.toJson(),
  };
}

class Mid {
  Mid({
    this.data,
  });

  Data? data;

  factory Mid.fromJson(Map<String, dynamic> json) => Mid(
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

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
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
