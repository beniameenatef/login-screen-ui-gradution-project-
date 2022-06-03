import 'dart:convert';
import 'package:design_ui/models/Research.dart';
import 'package:design_ui/models/graduatednumbrmodel.dart';
import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/oneyearmodel.dart';
import 'package:design_ui/models/protocolmodel.dart';
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/models/studentdistribution.dart';
import 'package:design_ui/models/studenttransactionmodel.dart';
import 'package:design_ui/models/surveyitemmodel.dart';
import 'package:design_ui/models/surveymodel.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/Mstaffmodel.dart';
import '../../models/bookTypemodel.dart';
import '../../models/labmodel.dart';
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
Future<Mstaff> PostMstaff( String name, String job) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/m-staffs';

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
    return Mstaff.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post mstaff.');
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
Future<Booktype> PostBookType(String name) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/book-types';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
          "data":{
            "Type":name

          }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Booktype.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post book type.');
  }
}
Future<Oneyear> PostOneYear(String year) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/academic-years';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "Year":year
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Oneyear.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post one year.');
  }
}
Future<GraduatedNumber> PostGraduatedNumber(int year,String cs , String Is,String ai , String ni) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/graduated-numbers?populate=deep,2';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "academic_year":year,
          "CS":{
            "Number":"${cs.toString()}"
          },
          "IS":{
            "Number":"${Is.toString()}"
          },
          "AI":{
            "Number":"${ai.toString()}"
          },
          "NI":{
            "Number":"${ni.toString()}"
          }

        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return GraduatedNumber.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post graduated number.');
  }
}
Future<Lab> PostLab(String labnumber , String pcnumber , int id) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/labs?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data": {
          "PCnumber":"${pcnumber.toString()}",
          "LabNumber":"${labnumber.toString()}",
          "MID":id
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Lab.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post lab.');
  }
}
Future<StudentActivity> PostStudentActivity(String total , String number ,String percentage, int id) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/student-activities?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data": {
          "Total":"${total.toString()}",
          "Number":"${number.toString()}",
          "Percentage":percentage,
          "Year":id
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return StudentActivity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post studentactivity.');
  }
}
Future<StudentDistribution> PostStudentDistribution(int year,int level,String male,String female,String cs , String Is,String ai , String ni,String general) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/student-distributions?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data": {
          "Level": level,
          "Male": "${male}",
          "Female": "${female}",
          "year": year,
          "CS": {
            "Number": "${cs}"
          },
          "IS": {
            "Number": "${Is}"
          },
          "AI": {
            "Number": "${ai}"
          },
          "NI": {
            "Number": "${ni}"
          },
          "General": {
            "Number": "${general}"
          }
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return StudentDistribution.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post student distribution.');
  }
}
Future<Surveys> PostSurvey(String Stype) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/surveys';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "sType":"${Stype}"
        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Surveys.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post survey.');
  }
}
Future<SurveyItems> PostSurveyItem(String describtion ,int survey) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/survey-items?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "Description":"${describtion.toString()}",
          "survey":survey

        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return SurveyItems.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post survey items.');
  }
}
Future<StudentTransaction> PostStudentTransaction(int percentage , int year , int survey) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/student-transactions?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "Percentage":percentage,
          "academic_year":year,
          "survey_item":survey

        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return StudentTransaction.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post student trasaction.');
  }
}

Future<Protocol> PostProtocol(String name , int prtocoltype) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/protocols?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "Name":"${name.toString()}",
          "protocol_type":prtocoltype

        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Protocol.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post protocol.');
  }
}
Future<Researches> PostResearch(String Rname , int year) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/researches?populate=*';

  final response = await http.post((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<dynamic,dynamic>{
        "data":{
          "RName":"${Rname.toString()}",
          "year":year

        }
      })
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Researches.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post research.');
  }
}




