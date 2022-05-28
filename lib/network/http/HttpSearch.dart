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