import 'dart:convert';

import 'package:design_ui/models/oneyearmodel.dart';
import 'package:http/http.dart' as http;

Future<int> SearchOneYear(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/academic-years?filters[Year][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search oneyear data');
  }

}
Future<int> SearchBooktype(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/book-types?filters[Type][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search booktype data');
  }

}
Future<int> SearchMstaff(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/m-staffs?filters[Name][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search Lab data');
  }

}
Future<int> SearchSurvey(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/surveys?filters[sType][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search survey data');
  }

}
Future<int> SearchSurveyItem(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/survey-items?filters[Description][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search survey item data');
  }

}
Future<int> SearchPrtocolType(String value) async {
  final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/protocol-types?filters[pType][\$eq]=${value}'));

  if(response.statusCode==200){
    print(response.body);
    int jsonResponse = json.decode(response.body)['data'][0]['id'] ;
    print(jsonResponse);
    return jsonResponse;
  }
  else
  {
    throw Exception('failed to get search protocol type data');
  }

}