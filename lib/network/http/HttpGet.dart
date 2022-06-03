import 'dart:convert';

import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/models/graduatednumbrmodel.dart';
import 'package:design_ui/models/labmodel.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/modelStaff.dart';
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/models/protocolmodel.dart';
import 'package:design_ui/models/protocoltype.dart';
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/models/studentdistribution.dart';
import 'package:design_ui/models/studenttransactionmodel.dart';
import 'package:design_ui/models/surveymodel.dart';
import 'package:design_ui/models/yearsmodel.dart';
import 'package:http/http.dart' as http;

import '../../models/Mstaffmodel.dart';
import '../../models/Research.dart';
import '../../models/surveyitemmodel.dart';
import '../../modules/Drawer/yeardropdwon.dart';

Future<Year> GetYears() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/academic-years?populate=deep,3'));

  if(response.statusCode==200){
    print(response.body);
    return Year.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get years data');
  }
}
Future<Oneyear> GetOneYears() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/academic-years'));

  if(response.statusCode==200){
    print(response.body);
    return Oneyear.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get one year data');
  }

}

Future<Library> GetLibrary() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/libraries?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return Library.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get library data');
  }
}
Future<Astaff> GetAstaff() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/a-staffs?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return Astaff.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get astaff data');
  }
}
Future<Booktype> GetBookType() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/book-types'));

  if(response.statusCode==200){
    print(response.body);
    return Booktype.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get book type data');
  }
}
Future<GraduatedNumber> GetGraduatedNumbers() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/graduated-numbers?populate=deep,2'));

  if(response.statusCode==200){
    print(response.body);
    return GraduatedNumber.fromJson(json.decode(response.body));
  }
  else
  {
    throw Exception('failed to get graduated number data');
  }
}
Future<Mstaff> GetMstaff() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/m-staffs'));

  if(response.statusCode==200){
    print(response.body);
    return Mstaff.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get mstaff data');
  }
}
Future<Lab> GetLab() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/labs?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Lab.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get lab data');
  }
}
Future<StudentActivity> GetStudentActivity() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/student-activities?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentActivity.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get student activity data');
  }
}
Future<StudentDistribution> GetStudentDistrubtion() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/student-distributions?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentDistribution.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get student distrbution data');
  }
}
Future<Surveys> GetSurvey() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/surveys'));

  if(response.statusCode==200){
    print(response.body);
    return Surveys.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get survey data');
  }
}
Future<SurveyItems> GetSurveyItem() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/survey-items?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return SurveyItems.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get survey item data');
  }
}
Future<StudentTransaction> GetStudentTransaction() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/student-transactions?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return StudentTransaction.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get student transaction data');
  }
}
Future<Protocol> Getprotocol() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/protocols?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Protocol.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get protocol data');
  }
}
Future<ProtocolType> GetprotocolType() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/protocol-types'));

  if(response.statusCode==200){
    print(response.body);
    return ProtocolType.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get protocol type data');
  }
}
Future<Researches> GetResearch() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/researches?populate=*'));

  if(response.statusCode==200){
    print(response.body);
    return Researches.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get research data');
  }
}