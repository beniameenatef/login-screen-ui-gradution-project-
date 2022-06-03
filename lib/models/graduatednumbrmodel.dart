// To parse this JSON data, do
//
//     final graduatedNumber = graduatedNumberFromJson(jsonString);

import 'dart:convert';

GraduatedNumber graduatedNumberFromJson(String str) => GraduatedNumber.fromJson(json.decode(str));

String graduatedNumberToJson(GraduatedNumber data) => json.encode(data.toJson());

class GraduatedNumber {
  GraduatedNumber({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory GraduatedNumber.fromJson(Map<String, dynamic> json) => GraduatedNumber(
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
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.cs,
    this.attributesIs,
    this.ai,
    this.ni,
    this.academicYear,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Cs? cs;
  Cs? attributesIs;
  Cs? ai;
  Cs? ni;
  AcademicYear? academicYear;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    cs: Cs.fromJson(json["CS"]),
    attributesIs: Cs.fromJson(json["IS"]),
    ai: Cs.fromJson(json["AI"]),
    ni: Cs.fromJson(json["AI"]),
    academicYear: AcademicYear.fromJson(json["academic_year"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "CS": cs?.toJson(),
    "IS": attributesIs?.toJson(),
    "AI": ai?.toJson(),
    "NI": ni?.toJson(),
    "academic_year": academicYear?.toJson(),
  };
}

class AcademicYear {
  AcademicYear({
    this.data,
  });

  Data? data;

  factory AcademicYear.fromJson(Map<String, dynamic> json) => AcademicYear(
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

class Cs {
  Cs({
    this.id,
    this.number,
  });

  int? id;
  String? number;

  factory Cs.fromJson(Map<String, dynamic> json) => Cs(
    id: json["id"],
    number: json["Number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Number": number,
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
