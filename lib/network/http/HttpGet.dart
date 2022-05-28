import 'dart:convert';

import 'package:design_ui/models/bookTypemodel.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/modelStaff.dart';
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/models/yearsmodel.dart';
import 'package:http/http.dart' as http;

import '../../modules/Drawer/yeardropdwon.dart';

Future<Year> GetYears() async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/academic-years?populate=deep,4'));

  if(response.statusCode==200){
    print(response.body);
    return Year.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get data');
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