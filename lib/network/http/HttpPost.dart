import 'dart:convert';
import 'package:design_ui/models/modelMaktba.dart';
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

Future<Library> PostLibrary( int num, int idyear , int idbook) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/libraries?populate=deep,2';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{

        "data":{
          "Number":num,
          "academic_year":{
            "id":idyear

          },
          "book_type":{
            "id":idbook
          }
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Library.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post library.');
  }
}
