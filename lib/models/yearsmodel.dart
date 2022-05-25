
// To parse this JSON data, do
//
//     final year = yearFromJson(jsonString);

import 'dart:convert';

Year yearFromJson(String str) => Year.fromJson(json.decode(str));

String yearToJson(Year data) => json.encode(data.toJson());

class Year {
  Year({
    this.data,
    this.meta,
  });

  List<YearDatum>? data;
  Meta? meta;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
    data: List<YearDatum>.from(json["data"].map((x) => YearDatum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta!.toJson(),
  };
}

class YearDatum {
  YearDatum({
    this.id,
    this.attributes,
  });

  int? id;
  PurpleAttributes? attributes;

  factory YearDatum.fromJson(Map<String, dynamic> json) => YearDatum(
    id: json["id"],
    attributes: PurpleAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class PurpleAttributes {
  PurpleAttributes({
    this.year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.graduatedNumber,
    this.research,
    this.studentDistributions,
    this.studentTransaction,
  });

  int? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  GraduatedNumber? graduatedNumber;
  Research? research;
  StudentDistributions? studentDistributions;
  StudentTransaction? studentTransaction;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
    year: json["Year"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    graduatedNumber: GraduatedNumber.fromJson(json["graduated_number"]),
    research: Research.fromJson(json["research"]),
    studentDistributions: StudentDistributions.fromJson(json["student_distributions"]),
    studentTransaction: StudentTransaction.fromJson(json["student_transaction"]),
  );

  Map<String, dynamic> toJson() => {
    "Year": year,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "graduated_number": graduatedNumber!.toJson(),
    "research": research!.toJson(),
    "student_distributions": studentDistributions!.toJson(),
    "student_transaction": studentTransaction!.toJson(),
  };
}

class GraduatedNumber {
  GraduatedNumber({
    this.data,
  });

  GraduatedNumberData? data;

  factory GraduatedNumber.fromJson(Map<String, dynamic> json) => GraduatedNumber(
    data: GraduatedNumberData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class GraduatedNumberData {
  GraduatedNumberData({
    this.id,
    this.attributes,
  });

  int? id;
  FluffyAttributes? attributes;

  factory GraduatedNumberData.fromJson(Map<String, dynamic> json) => GraduatedNumberData(
    id: json["id"],
    attributes: FluffyAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class FluffyAttributes {
  FluffyAttributes({
    this.number,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.cs,
    this.attributesIs,
  });

  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<C>? cs;
  List<C>? attributesIs;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
    number: json["Number"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    cs: List<C>.from(json["CS"].map((x) => C.fromJson(x))),
    attributesIs: List<C>.from(json["IS"].map((x) => C.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Number": number,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "CS": List<dynamic>.from(cs!.map((x) => x.toJson())),
    "IS": List<dynamic>.from(attributesIs!.map((x) => x.toJson())),
  };
}

class C {
  C({
    this.id,
    this.number,
  });

  int? id;
  String? number;

  factory C.fromJson(Map<String, dynamic> json) => C(
    id: json["id"],
    number: json["Number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Number": number,
  };
}

class Research {
  Research({
    this.data,
  });

  List<ResearchDatum>? data;

  factory Research.fromJson(Map<String, dynamic> json) => Research(
    data: List<ResearchDatum>.from(json["data"].map((x) => ResearchDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ResearchDatum {
  ResearchDatum({
    this.id,
    this.attributes,
  });

  int? id;
  TentacledAttributes? attributes;

  factory ResearchDatum.fromJson(Map<String, dynamic> json) => ResearchDatum(
    id: json["id"],
    attributes: TentacledAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class TentacledAttributes {
  TentacledAttributes({
    this.name,
    this.impact,
    this.journalName,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.aStaff,
    this.majorOfResearch,
  });

  String? name;
  String? impact;
  String? journalName;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  AStaff? aStaff;
  MajorOfResearch? majorOfResearch;

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) => TentacledAttributes(
    name: json["Name"],
    impact: json["Impact"],
    journalName: json["JournalName"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    aStaff: AStaff.fromJson(json["a_staff"]),
    majorOfResearch: MajorOfResearch.fromJson(json["major_of_research"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Impact": impact,
    "JournalName": journalName,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "a_staff": aStaff!.toJson(),
    "major_of_research": majorOfResearch!.toJson(),
  };
}

class AStaff {
  AStaff({
    this.data,
  });

  AStaffData? data;

  factory AStaff.fromJson(Map<String, dynamic> json) => AStaff(
    data: AStaffData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class AStaffData {
  AStaffData({
    this.id,
    this.attributes,
  });

  int? id;
  StickyAttributes? attributes;

  factory AStaffData.fromJson(Map<String, dynamic> json) => AStaffData(
    id: json["id"],
    attributes: StickyAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class StickyAttributes {
  StickyAttributes({
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

  factory StickyAttributes.fromJson(Map<String, dynamic> json) => StickyAttributes(
    name: json["Name"],
    job: json["Job"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Job": job,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
  };
}

class MajorOfResearch {
  MajorOfResearch({
    this.data,
  });

  MajorOfResearchData? data;

  factory MajorOfResearch.fromJson(Map<String, dynamic> json) => MajorOfResearch(
    data: MajorOfResearchData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class MajorOfResearchData {
  MajorOfResearchData({
    this.id,
    this.attributes,
  });

  int? id;
  IndigoAttributes? attributes;

  factory MajorOfResearchData.fromJson(Map<String, dynamic> json) => MajorOfResearchData(
    id: json["id"],
    attributes: IndigoAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class IndigoAttributes {
  IndigoAttributes({
    this.researchName,
    this.field,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.sType,
  });

  String? researchName;
  String? field;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? sType;

  factory IndigoAttributes.fromJson(Map<String, dynamic> json) => IndigoAttributes(
    researchName: json["ResearchName"] == null ? null : json["ResearchName"],
    field: json["Field"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    sType: json["sType"] == null ? null : json["sType"],
  );

  Map<String, dynamic> toJson() => {
    "ResearchName": researchName == null ? null : researchName,
    "Field": field,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "sType": sType == null ? null : sType,
  };
}

class StudentDistributions {
  StudentDistributions({
    this.data,
  });

  List<StudentDistributionsDatum>? data;

  factory StudentDistributions.fromJson(Map<String, dynamic> json) => StudentDistributions(
    data: List<StudentDistributionsDatum>.from(json["data"].map((x) => StudentDistributionsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class StudentDistributionsDatum {
  StudentDistributionsDatum({
    this.id,
    this.attributes,
  });

  int? id;
  IndecentAttributes? attributes;

  factory StudentDistributionsDatum.fromJson(Map<String, dynamic> json) => StudentDistributionsDatum(
    id: json["id"],
    attributes: IndecentAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class IndecentAttributes {
  IndecentAttributes({
    this.level,
    this.male,
    this.female,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  int? level;
  String? male;
  String? female;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory IndecentAttributes.fromJson(Map<String, dynamic> json) => IndecentAttributes(
    level: json["Level"],
    male: json["Male"],
    female: json["Female"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Male": male,
    "Female": female,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
  };
}

class StudentTransaction {
  StudentTransaction({
    this.data,
  });

  StudentTransactionData? data;

  factory StudentTransaction.fromJson(Map<String, dynamic> json) => StudentTransaction(
    data: StudentTransactionData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class StudentTransactionData {
  StudentTransactionData({
    this.id,
    this.attributes,
  });

  int? id;
  HilariousAttributes? attributes;

  factory StudentTransactionData.fromJson(Map<String, dynamic> json) => StudentTransactionData(
    id: json["id"],
    attributes: HilariousAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class HilariousAttributes {
  HilariousAttributes({
    this.total,
    this.percentage,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.surveyItems,
  });

  String? total;
  double? percentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SurveyItems? surveyItems;

  factory HilariousAttributes.fromJson(Map<String, dynamic> json) => HilariousAttributes(
    total: json["Total"],
    percentage: json["Percentage"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    surveyItems: SurveyItems.fromJson(json["survey_items"]),
  );

  Map<String, dynamic> toJson() => {
    "Total": total,
    "Percentage": percentage,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "survey_items": surveyItems!.toJson(),
  };
}

class SurveyItems {
  SurveyItems({
    this.data,
  });

  List<SurveyItemsDatum>? data;

  factory SurveyItems.fromJson(Map<String, dynamic> json) => SurveyItems(
    data: List<SurveyItemsDatum>.from(json["data"].map((x) => SurveyItemsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SurveyItemsDatum {
  SurveyItemsDatum({
    this.id,
    this.attributes,
  });

  int? id;
  AmbitiousAttributes? attributes;

  factory SurveyItemsDatum.fromJson(Map<String, dynamic> json) => SurveyItemsDatum(
    id: json["id"],
    attributes: AmbitiousAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes!.toJson(),
  };
}

class AmbitiousAttributes {
  AmbitiousAttributes({
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.sid,
  });

  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  MajorOfResearch? sid;

  factory AmbitiousAttributes.fromJson(Map<String, dynamic> json) => AmbitiousAttributes(
    description: json["Description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
    sid: MajorOfResearch.fromJson(json["SID"]),
  );

  Map<String, dynamic> toJson() => {
    "Description": description,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "publishedAt": publishedAt!.toIso8601String(),
    "SID": sid!.toJson(),
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}