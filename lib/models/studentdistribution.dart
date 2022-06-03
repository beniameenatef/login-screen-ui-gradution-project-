// To parse this JSON data, do
//
//     final studentDistribution = studentDistributionFromJson(jsonString);

import 'dart:convert';

StudentDistribution studentDistributionFromJson(String str) => StudentDistribution.fromJson(json.decode(str));

String studentDistributionToJson(StudentDistribution data) => json.encode(data.toJson());

class StudentDistribution {
  StudentDistribution({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory StudentDistribution.fromJson(Map<String, dynamic> json) => StudentDistribution(
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
    this.level,
    this.male,
    this.female,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.year,
    this.cs,
    this.attributesIs,
    this.ai,
    this.ni,
    this.general,
  });

  int? level;
  String? male;
  String? female;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Yeear? year;
  Ai? cs;
  Ai? attributesIs;
  Ai? ai;
  Ai? ni;
  Ai? general;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    level: json["Level"],
    male: json["Male"],
    female: json["Female"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    year: Yeear.fromJson(json["year"]),
    cs: Ai.fromJson(json["CS"]),
    attributesIs: Ai.fromJson(json["IS"]),
    ai: Ai.fromJson(json["AI"]),
    ni: Ai.fromJson(json["NI"]),
    general: Ai.fromJson(json["General"]),
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Male": male,
    "Female": female,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "year": year?.toJson(),
    "CS": cs?.toJson(),
    "IS": attributesIs?.toJson(),
    "AI": ai?.toJson(),
    "NI": ni?.toJson(),
    "General": general?.toJson(),
  };
}

class Ai {
  Ai({
    this.id,
    this.number,
  });

  int? id;
  String? number;

  factory Ai.fromJson(Map<String, dynamic> json) => Ai(
    id: json["id"],
    number: json["Number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Number": number,
  };
}

class Yeear {
  Yeear({
    this.data,
  });

  Data? data;

  factory Yeear.fromJson(Map<String, dynamic> json) => Yeear(
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
