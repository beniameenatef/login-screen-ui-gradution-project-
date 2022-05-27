import 'dart:convert';

Library libraryFromJson(String str) => Library.fromJson(json.decode(str));

String libraryToJson(Library data) => json.encode(data.toJson());

class Library {
  Library({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Library.fromJson(Map<String, dynamic> json) => Library(
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
    this.number,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.academicYear,
    this.bookType,
  });

  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  AcademicYear? academicYear;
  AcademicYear? bookType;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    number: json["Number"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    academicYear: AcademicYear.fromJson(json["academic_year"]),
    bookType: AcademicYear.fromJson(json["book_type"]),
  );

  Map<String, dynamic> toJson() => {
    "Number": number,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "academic_year": academicYear?.toJson(),
    "book_type": bookType?.toJson(),
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
    this.type,
  });

  String? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? type;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
    year: json["Year"] == null ? null : json["Year"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    type: json["Type"] == null ? null : json["Type"],
  );

  Map<String, dynamic> toJson() => {
    "Year": year == null ? null : year,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "Type": type == null ? null : type,
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