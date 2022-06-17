import 'dart:convert';

import 'package:design_ui/models/userdatamodel.dart';
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
import '../../models/studentactivitymodel.dart';
import '../../models/studentdistribution.dart';
import '../../models/studenttransactionmodel.dart';
import '../../models/surveyitemmodel.dart';
import '../../models/surveymodel.dart';

Future<Users> PutUsers( int id ,String role) async {

  dynamic api = 'https://qms-application.herokuapp.com/api/users/${id}';

  final response = await http.put((Uri.parse(api)), headers:<String , String> {
    //'Authorization' : 'xyz',
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<String,dynamic>{

        "visible":"${role}"

      })
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put user.');
  }
}
// Future<Mstaff> PutMstaff( int id ,String name, String job) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/m-staffs/${id}';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<String,dynamic>{
//
//         "data":{
//           "Name": "${name.toString()}",
//           "Job": "${job.toString()}"
//         }
//
//       })
//   );
//
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Mstaff.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put mstaff.');
//   }
// }
// Future<Astaff> PutAstaff( int id ,String name, String job) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/a-staffs/${id}';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<String,dynamic>{
//
//         "data":{
//           "Name": "${name.toString()}",
//           "Job": "${job.toString()}"
//         }
//
//       })
//   );
//
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Astaff.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put astaff.');
//   }
// }
//
// Future<Library> PutLibrary( int id ,int num, int idyear , int idbook) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/libraries/${id}?populate=deep,2';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//
//         "data":{
//           "Number":num,
//           "academic_year":{
//             "id":idyear
//           },
//           "book_type":{
//             "id":idbook
//           }
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Library.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put library.');
//   }
// }
// Future<Booktype> PutBookType(int id,String name) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/book-types/${id}';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "Type":name
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Booktype.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put book type.');
//   }
// }
// Future<Oneyear> PutOneYear(int id ,String year) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/academic-years/${id}';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "Year":year
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Oneyear.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put one year.');
//   }
// }
// Future<GraduatedNumber> PutGraduatedNumber(int id ,int year,String cs , String Is,String ai , String ni) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/graduated-numbers/${id}?populate=deep,2';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "academic_year":year,
//           "CS":{
//             "Number":"${cs.toString()}"
//           },
//           "IS":{
//             "Number":"${Is.toString()}"
//           },
//           "AI":{
//             "Number":"${ai.toString()}"
//           },
//           "NI":{
//             "Number":"${ni.toString()}"
//           }
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return GraduatedNumber.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put graduated number.');
//   }
// }
// Future<Lab> PutLab(int id ,String labnumber , String pcnumber , int id2) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/labs/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data": {
//           "PCnumber":"${pcnumber.toString()}",
//           "LabNumber":"${labnumber.toString()}",
//           "MID":id2
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Lab.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put lab.');
//   }
// }
// Future<StudentActivity> PutStudentActivity(int id ,String total , String number ,String percentage, int id2) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/student-activities/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data": {
//           "Total":"${total.toString()}",
//           "Number":"${number.toString()}",
//           "Percentage":percentage,
//           "Year":id2
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return StudentActivity.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put studentactivity.');
//   }
// }
// Future<StudentDistribution> PutStudentDistribution(int id,int year,int level,String male,String female,String cs , String Is,String ai , String ni,String general) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/student-distributions/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data": {
//           "Level": level,
//           "Male": "${male}",
//           "Female": "${female}",
//           "year": year,
//           "CS": {
//             "Number": "${cs}"
//           },
//           "IS": {
//             "Number": "${Is}"
//           },
//           "AI": {
//             "Number": "${ai}"
//           },
//           "NI": {
//             "Number": "${ni}"
//           },
//           "General": {
//             "Number": "${general}"
//           }
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return StudentDistribution.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put student distribution.');
//   }
// }
// Future<Surveys> PutSurvey(int id,String Stype) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/surveys/${id}';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "sType":"${Stype}"
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Surveys.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put survey.');
//   }
// }
// Future<SurveyItems> PutSurveyItem(int id,String describtion ,int survey) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/survey-items/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "Description":"${describtion.toString()}",
//           "survey":survey
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return SurveyItems.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put survey items.');
//   }
// }
// Future<StudentTransaction> PutStudentTransaction(int id ,int percentage , int year , int survey) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/student-transactions/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "Percentage":percentage,
//           "academic_year":year,
//           "survey_item":survey
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return StudentTransaction.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put student trasaction.');
//   }
// }
//
// Future<Protocol> PutProtocol(int id,String name , int prtocoltype) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/protocols/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "Name":"${name.toString()}",
//           "protocol_type":prtocoltype
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Protocol.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put protocol.');
//   }
// }
// Future<Researches> PutResearch(int id ,String Rname , int year) async {
//
//   dynamic api = 'https://qms-application.herokuapp.com/api/researches/${id}?populate=*';
//
//   final response = await http.put((Uri.parse(api)), headers:<String , String> {
//     //'Authorization' : 'xyz',
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//       body: jsonEncode(<dynamic,dynamic>{
//         "data":{
//           "RName":"${Rname.toString()}",
//           "year":year
//
//         }
//       })
//   );
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     return Researches.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to put research.');
//   }
// }
//
//
//
//
