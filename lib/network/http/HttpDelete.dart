import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/Mstaffmodel.dart';
import '../../models/Research.dart';
import '../../models/bookTypemodel.dart';
import '../../models/graduatednumbrmodel.dart';
import '../../models/labmodel.dart';
import '../../models/modelMaktba.dart';
import '../../models/modelStaff.dart';
import '../../models/oneyearmodel.dart';
import '../../models/protocolmodel.dart';
import '../../models/protocoltype.dart';
import '../../models/studentactivitymodel.dart';
import '../../models/studentdistribution.dart';
import '../../models/studenttransactionmodel.dart';
import '../../models/surveyitemmodel.dart';
import '../../models/surveymodel.dart';
import '../../models/yearsmodel.dart';

Future<Year> DeleteYears(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/academic-years/${id}?populate=deep,3'));

  if(response.statusCode==200){
    print(response.body);
    return Year.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete years data');
  }
}
Future<Oneyear> DeleteOneYears(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/academic-years/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return Oneyear.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete one year data');
  }

}

Future<Library> DeleteLibrary(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/libraries/${id}?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return Library.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete library data');
  }
}
Future<Astaff> DeleteAstaff(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/a-staffs/${id}?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return Astaff.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete astaff data');
  }
}
Future<Booktype> DeleteBookType(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/book-types/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return Booktype.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete book type data');
  }
}
Future<GraduatedNumber> DeleteGraduatedNumbers(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/graduated-numbers/${id}?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return GraduatedNumber.fromJson(json.decode(response.body));
  }
  else
  {
    throw Exception('failed to delete graduated number data');
  }
}
Future<Mstaff> DeleteMstaff(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/m-staffs/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return Mstaff.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete mstaff data');
  }
}
Future<Lab> DeleteLab(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/labs/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Lab.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete lab data');
  }
}
Future<StudentActivity> DeleteStudentActivity(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/student-activities/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentActivity.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete student activity data');
  }
}
Future<StudentDistribution> DeleteStudentDistrubtion(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/student-distributions/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentDistribution.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete student distrbution data');
  }
}
Future<Surveys> DeleteSurvey(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/surveys/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return Surveys.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete survey data');
  }
}
Future<SurveyItems> DeleteSurveyItem(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/survey-items/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return SurveyItems.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete survey item data');
  }
}
Future<StudentTransaction> DeleteStudentTransaction(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/student-transactions/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentTransaction.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete student transaction data');
  }
}
Future<Protocol> Deleteprotocol(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/protocols/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Protocol.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete protocol data');
  }
}
Future<ProtocolType> DeleteprotocolType(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/protocol-types/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return ProtocolType.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete protocol type data');
  }
}
Future<Researches> DeleteResearch(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/researches/${id}?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Researches.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete research data');
  }
}