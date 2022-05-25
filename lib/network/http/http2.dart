import 'dart:convert';

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