import 'dart:convert';

import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/modelStaff.dart';
import 'package:design_ui/models/yearsmodel.dart';
import 'package:http/http.dart' as http;

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