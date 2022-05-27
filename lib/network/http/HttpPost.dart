import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/modelStaff.dart';


Future<Astaff> PostAstaff( String name, String job) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/a-staffs';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<String,dynamic>{

        "data":{
          "Name": "${name.toString()}",
          "Job": "${job.toString()}"
        }

      })
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Astaff.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post astaff.');
  }
}
