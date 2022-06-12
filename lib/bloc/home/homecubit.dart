import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../modules/ScreenNavigationBar/Home/ScreensHome/charts.dart';
import '../../modules/ScreenNavigationBar/Home/ScreensHome/overview.dart';
import '../../modules/ScreenNavigationBar/Home/ScreensHome/tables.dart';
import '../../modules/ScreenNavigationBar/Home/home.dart';
import '../../modules/ScreenNavigationBar/feedback.dart';
import '../../modules/ScreenNavigationBar/profile.dart';
import '../../modules/ScreenNavigationBar/setting.dart';
import 'homestate.dart';

class homecubit extends Cubit<qualityhomestates> {
  homecubit() : super(qualityhomeInitialState());

  static homecubit get(context) => BlocProvider.of(context);

  int currentindexnavbar = 0;

  List<Widget> screenNavigationbar = [
    homescreen(),
    feedback(),
    profile(),
    setting(),
  ];

  void changebottomnavifationbar(int index) {
    currentindexnavbar = index;
    emit(qualitynavigationbarstate());
  }

  int currnetindextabbar = 0;
  List<Widget> screentabbar = [
    Homeoverview(),
    Homecharts(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
    TablesHome(),
  ];

  void Homechangetapappbar(int index) {
    currnetindextabbar = index;
    emit(qualitytapappbarstate());
  }

  void Staffchangetapappbar(int index) {
    currnetindextabbar = index;
    emit(qualitytStaffapappbarstate());
  }

  // Future<bool?>checkconnection() async{
  //   emit(qualitycheckconnectionloadingstate());
  //   await InternetAddress.lookup("google.com").then((value)
  //   {
  //     if(value.isNotEmpty&&value[0].rawAddress.isNotEmpty)
  //     {
  //       print("connect");
  //       emit(qualitycheckconnectionsuccessstate());
  //       return true;
  //     }else
  //       {
  //         print("not connect");
  //         return false;
  //       }
  //   }).catchError((error)
  //   {
  //     emit(qualitycheckconnectionerrorstate(error.toString()));
  //     print("error");
  //
  //     return false;
  //   });
  // }

  Astaff? modelastaff;

  Future<Astaff?> PostAstaff({String? name, String? job}) async {
    emit(qualitypostastaffloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/a-staffs';

    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {"Name": "${name.toString()}", "Job": "${job.toString()}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelastaff = Astaff.fromJson(jsonDecode(value.body));
        emit(qualitypostastaffsuccessstate());
        return modelastaff;
      } else {
        throw Exception('Failed to post astaff.');
      }
    }).catchError((error) {
      emit(qualitypostastafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Astaff?> PutAstaff({int? id, String? name, String? job}) async {
    emit(qualityputastaffloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/a-staffs/${id}';

    final response = await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {"Name": "${name.toString()}", "Job": "${job.toString()}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelastaff = Astaff.fromJson(jsonDecode(value.body));
        emit(qualityputastaffsuccessstate());
        return modelastaff;
      } else {
        throw Exception('Failed to put astaff.');
      }
    }).catchError((error) {
      emit(qualityputastafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Astaff?> DeleteAstaff({int? id}) async {
    emit(qualitydeleteastaffloadingstate());
    final response = await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/a-staffs/${id}?populate=deep,2'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelastaff = Astaff.fromJson(jsonDecode(value.body));
        emit(qualitydeleteastaffsuccessstate());
        return modelastaff;
      } else {
        throw Exception('failed to delete astaff data');
      }
    }).catchError((error) {
      emit(qualitydeleteastafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Mstaff? modelmstaff;

  Future<Mstaff?> PostMstaff({String? name, String? job}) async {
    emit(qualitypostmstaffloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/m-staffs';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {"Name": "${name.toString()}", "Job": "${job.toString()}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelmstaff = mstaffFromJson(json.decode(value.body));
        emit(qualitypostmstaffsuccessstate());
        return modelmstaff;
      } else {
        throw Exception('Failed to post mstaff.');
      }
    }).catchError((error) {
      emit(qualitypostmstafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Mstaff?> PutMstaff({int? id, String? name, String? job}) async {
    emit(qualityputmstaffloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/m-staffs/${id}';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {"Name": "${name.toString()}", "Job": "${job.toString()}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelmstaff = Mstaff.fromJson(jsonDecode(value.body));
        emit(qualityputmstaffsuccessstate());
        return modelmstaff;
      } else {
        throw Exception('Failed to put mstaff.');
      }
    }).catchError((error) {
      emit(qualityputmstafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Mstaff?> DeleteMstaff({int? id}) async {
    emit(qualitydeletemstaffloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/m-staffs/${id}'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelmstaff = Mstaff.fromJson(jsonDecode(value.body));
        emit(qualitydeletemstaffsuccessstate());
        return modelmstaff;
      } else {
        throw Exception('failed to delete mstaff data');
      }
    }).catchError((error) {
      emit(qualitydeletemstafferrorstate(error.toString()));
      print(error.toString());
    });
  }

  Oneyear? modeloneyear;

  Future<Oneyear?> PostOneYear({String? year}) async {
    emit(qualitypostoneyearloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/academic-years';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"Year": year}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modeloneyear = Oneyear.fromJson(jsonDecode(value.body));
        emit(qualitypostoneyearsuccessstate());
        return modeloneyear;
      } else {
        throw Exception('Failed to post one year.');
      }
    }).catchError((error) {
      emit(qualitypostoneyearerrorstate(error.toString()));
      print(error);
    });
  }

  Future<Oneyear?> PutOneYear({int? id, String? year}) async {
    emit(qualityputoneyearloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/academic-years/${id}';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"Year": year}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modeloneyear = Oneyear.fromJson(jsonDecode(value.body));
        emit(qualitypostoneyearsuccessstate());
        return modeloneyear;
      } else {
        throw Exception('Failed to put one year.');
      }
    }).catchError((error) {
      emit(qualitypostoneyearerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Oneyear?> DeleteOneYears({int? id}) async {
    emit(qualitydeleteoneyearloadingstate());
    final response = await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/academic-years/${id}'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modeloneyear = Oneyear.fromJson(jsonDecode(value.body));
        emit(qualitydeleteoneyearsuccessstate());
        return modeloneyear;
      } else {
        throw Exception('failed to delete one year data');
      }
    }).catchError((error) {
      emit(qualitydeleteoneyearerrorstate(error.toString()));
      print(error);
    });
  }

  Booktype? modelbooktype;

  Future<Booktype?> PostBookType({String? name}) async {
    emit(qualitypostbooktypeloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/book-types';

    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"Type": name}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelbooktype = Booktype.fromJson(jsonDecode(value.body));
        emit(qualitypostbooktypesuccessstate());
        return modelbooktype;
      } else {
        throw Exception('Failed to post book type.');
      }
    }).catchError((error) {
      emit(qualitypostbooktypeerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Booktype?> PutBookType({int? id, String? name}) async {
    emit(qualityputbooktypeloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/book-types/${id}';

    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"Type": name}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelbooktype = Booktype.fromJson(jsonDecode(value.body));
        emit(qualityputbooktypesuccessstate());
        return modelbooktype;
      } else {
        throw Exception('Failed to put book type.');
      }
    }).catchError((error) {
      emit(qualityputbooktypeerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Booktype?> DeleteBookType({int? id}) async {
    emit(qualitydeletebooktypeloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/book-types/${id}'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        emit(qualitydeletebooktypesuccessstate());
        modelbooktype = Booktype.fromJson(jsonDecode(value.body));
        return modelbooktype;
      } else {
        throw Exception('failed to delete book type data');
      }
    }).catchError((error) {
      emit(qualitydeletebooktypeerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Lab? modellab;

  Future<Lab?> PostLab({String? labnumber, String? pcnumber, int? id}) async {
    emit(qualitypostlabloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/labs?populate=*';

    final response = await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "PCnumber": "${pcnumber.toString()}",
            "LabNumber": "${labnumber.toString()}",
            "MID": id
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modellab = Lab.fromJson(jsonDecode(value.body));
        emit(qualitypostlabsuccessstate());
        return modellab;
      } else {
        throw Exception('Failed to post lab.');
      }
    }).catchError((error) {
      emit(qualitypostlaberrorstate(error.toString()));
      print(error);
    });
  }

  Future<Lab?> PutLab(
      {int? id, String? labnumber, String? pcnumber, int? id2}) async {
    emit(qualityputlabloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/labs/${id}?populate=*';

    final response = await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "PCnumber": "${pcnumber.toString()}",
            "LabNumber": "${labnumber.toString()}",
            "MID": id2
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modellab = Lab.fromJson(jsonDecode(value.body));
        emit(qualityputlabsuccessstate());
        return modellab;
      } else {
        throw Exception('Failed to put lab.');
      }
    }).catchError((error) {
      emit(qualityputlaberrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Lab?> DeleteLab({int? id}) async {
    emit(qualitydeletelabloadingstate());
    final response = await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/labs/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modellab = Lab.fromJson(jsonDecode(value.body));
        emit(qualitydeletelabsuccessstate());
        return modellab;
      } else {
        throw Exception('failed to delete lab data');
      }
    }).catchError((error) {
      emit(qualitydeletelaberrorstate(error.toString()));
      print(error);
    });
  }

  Library? librarymodel;

  Future<Library?> PostLibrary({int? num, int? idyear, int? idbook}) async {
    emit(qualitypostlibraryloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/libraries?populate=deep,2';

    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Number": num,
            "academic_year": {"id": idyear},
            "book_type": {"id": idbook}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        // print(data);
        librarymodel = Library.fromJson(jsonDecode(value.body));
        emit(qualitypostlibrarysuccessstate());
        return librarymodel;
      } else {
        throw Exception('Failed to post library.');
      }
    }).catchError((error) {
      emit(qualitypostlibraryerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Library?> DeleteLibrary(int? id) async {
    emit(qualitydeletelibraryloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/libraries/${id}?populate=deep,2'))
        .then((value) {
      if (value.statusCode == 200) {
        // print(value.body);
        librarymodel = Library.fromJson(jsonDecode(value.body));
        emit(qualitydeletelibrarysuccessstate());
        return librarymodel;
      } else {
        throw Exception('failed to delete library data');
      }
    }).catchError((error) {
      emit(qualitydeletelibraryerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Library?> PutLibrary(
      {int? id, int? num, int? idyear, int? idbook}) async {
    emit(qualityputlibraryloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/libraries/${id}?populate=deep,2';

    final response = await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Number": num,
            "academic_year": {"id": idyear},
            "book_type": {"id": idbook}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        // print(data);
        librarymodel = Library.fromJson(jsonDecode(value.body));
        emit(qualityputlibrarysuccessstate());
        return librarymodel;
      } else {
        throw Exception('Failed to put library.');
      }
    }).catchError((error) {
      emit(qualityputlibraryerrorstate(error.toString()));
      print(error.toString());
    });
  }

  GraduatedNumber? modelgraduatednumber;

  Future<GraduatedNumber?> PostGraduatedNumber(
      {int? year, String? cs, String? Is, String? ai, String? ni}) async {
    emit(qualitypostgraduatednumberloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/graduated-numbers?populate=deep,2';

    final response = await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "academic_year": year,
            "CS": {"Number": "${cs.toString()}"},
            "IS": {"Number": "${Is.toString()}"},
            "AI": {"Number": "${ai.toString()}"},
            "NI": {"Number": "${ni.toString()}"}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelgraduatednumber = GraduatedNumber.fromJson(jsonDecode(value.body));
        emit(qualitypostlgraduatednumbersuccessstate());
        return modelgraduatednumber;
      } else {
        throw Exception('Failed to post graduated number.');
      }
    }).catchError((error) {
      emit(qualitypostgraduatednumbererrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<GraduatedNumber?> PutGraduatedNumber(
      {int? id,
        int? year,
        String? cs,
        String? Is,
        String? ai,
        String? ni}) async {
    emit(qualityputgraduatednumberloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/graduated-numbers/${id}?populate=deep,2';

    final response = await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "academic_year": year,
            "CS": {"Number": "${cs.toString()}"},
            "IS": {"Number": "${Is.toString()}"},
            "AI": {"Number": "${ai.toString()}"},
            "NI": {"Number": "${ni.toString()}"}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelgraduatednumber = GraduatedNumber.fromJson(jsonDecode(value.body));
        emit(qualityputgraduatednumbersuccessstate());
        return modelgraduatednumber;
      } else {
        throw Exception('Failed to put graduated number.');
      }
    }).catchError((error) {
      emit(qualitypostgraduatednumbererrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<GraduatedNumber?> DeleteGraduatedNumbers({int? id}) async {
    emit(qualitydeletegraduatednumberloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/graduated-numbers/${id}?populate=deep,2'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        emit(qualitydeletegraduatednumbersuccessstate());
        modelgraduatednumber =
            GraduatedNumber.fromJson(json.decode(value.body));
        return modelgraduatednumber;
      } else {
        throw Exception('failed to delete graduated number data');
      }
    }).catchError((error) {
      emit(qualitydeletegraduatednumbererrorstate(error.toString()));
      print(error.toString());
    });
  }

  Protocol? modelprotocol;

  Future<Protocol?> PostProtocol({String? name, int? prtocoltype}) async {
    emit(qualitypostprotocolloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/protocols?populate=*';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Name": "${name.toString()}",
            "protocol_type": prtocoltype
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelprotocol = Protocol.fromJson(jsonDecode(value.body));
        emit(qualitypostlprotocolsuccessstate());
        return modelprotocol;
      } else {
        throw Exception('Failed to post protocol.');
      }
    }).catchError((error) {
      emit(qualitypostprotocolerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Protocol?> PutProtocol(
      {int? id, String? name, int? prtocoltype}) async {
    emit(qualityputprotocolloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/protocols/${id}?populate=*';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Name": "${name.toString()}",
            "protocol_type": prtocoltype
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelprotocol = Protocol.fromJson(jsonDecode(value.body));
        emit(qualityputprotocolsuccessstate());
        return modelprotocol;
      } else {
        throw Exception('Failed to put protocol.');
      }
    }).catchError((error) {
      emit(qualityputprotocolerrorstate(error.toString()));
      print(error.toString());
    });
  }
  Future<Protocol?> Deleteprotocol({int? id}) async {
    emit(qualitydeleteprotocolloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/protocols/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelprotocol = Protocol.fromJson(jsonDecode(value.body));
        emit(qualitydeleteprotocolsuccessstate());
        return modelprotocol;
      } else {
        throw Exception('failed to delete protocol data');
      }
    }).catchError((error) {
      emit(qualitydeleteprotocolerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Researches? modelresearch;

  Future<Researches?> PostResearch({String? Rname, int? year}) async {
    emit(qualitypostresearchloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/researches?populate=*';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"RName": "${Rname.toString()}", "year": year}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelresearch = Researches.fromJson(jsonDecode(value.body));
        emit(qualitypostresearchsuccessstate());
        return modelresearch;
      } else {
        throw Exception('Failed to post research.');
      }
    }).catchError((error) {
      emit(qualitypostresearcherrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Researches?> PutResearch({int? id, String? Rname, int? year}) async {
    emit(qualityputresearchloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/researches/${id}?populate=*';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"RName": "${Rname.toString()}", "year": year}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelresearch = Researches.fromJson(jsonDecode(value.body));
        emit(qualityputresearchsuccessstate());
        return modelresearch;
      } else {
        throw Exception('Failed to put research.');
      }
    }).catchError((error) {
      emit(qualityputresearcherrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Researches?> DeleteResearch({int? id}) async {
    emit(qualitydeleteresearchloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/researches/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelresearch = Researches.fromJson(jsonDecode(value.body));
        emit(qualitydeleteresearchsuccessstate());
        return modelresearch;
      } else {
        throw Exception('failed to delete research data');
      }
    }).catchError((error) {
      emit(qualitydeleteresearcherrorstate(error.toString()));
      print(error.toString());
    });
  }

  StudentActivity? modelstudentactivity;

  Future<StudentActivity?> PostStudentActivity(
      {String? total, String? number, String? percentage, int? id}) async {
    emit(qualitypoststudentactivityloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-activities?populate=*';

    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Total": "${total.toString()}",
            "Number": "${number.toString()}",
            "Percentage": percentage,
            "Year": id
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelstudentactivity = StudentActivity.fromJson(jsonDecode(value.body));
        emit(qualitypoststudentactivitysuccessstate());
        return modelstudentactivity;
      } else {
        throw Exception('Failed to post studentactivity.');
      }
    }).catchError((error) {
      emit(qualitypoststudentactivityerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentActivity?> PutStudentActivity(
      {int? id,
        String? total,
        String? number,
        String? percentage,
        int? id2}) async {
    emit(qualityputstudentactivityloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-activities/${id}?populate=*';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Total": "${total.toString()}",
            "Number": "${number.toString()}",
            "Percentage": percentage,
            "Year": id2
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelstudentactivity = StudentActivity.fromJson(jsonDecode(value.body));
        emit(qualityputstudentactivitysuccessstate());
        return modelstudentactivity;
      } else {
        throw Exception('Failed to put studentactivity.');
      }
    }).catchError((error) {
      emit(qualityputstudentactivityerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentActivity?> DeleteStudentActivity({int? id}) async {
    emit(qualitydeleteresearchloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/student-activities/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelstudentactivity = StudentActivity.fromJson(jsonDecode(value.body));
        emit(qualitydeletestudentactivitysuccessstate());
        return modelstudentactivity;
      } else {
        throw Exception('failed to delete student activity data');
      }
    }).catchError((error) {
      emit(qualitydeletestudentactivityerrorstate(error.toString()));
      print(error.toString());
    });
  }

  StudentDistribution? modelStudentdistribution;

  Future<StudentDistribution?> PostStudentDistribution(
      {int? year,
        int? level,
        String? male,
        String? female,
        String? cs,
        String? Is,
        String? ai,
        String? ni,
        String? general}) async {
    emit(qualitypoststudentdistributionloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-distributions?populate=*';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Level": level,
            "Male": "${male}",
            "Female": "${female}",
            "year": year,
            "CS": {"Number": "${cs}"},
            "IS": {"Number": "${Is}"},
            "AI": {"Number": "${ai}"},
            "NI": {"Number": "${ni}"},
            "General": {"Number": "${general}"}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelStudentdistribution =
            StudentDistribution.fromJson(jsonDecode(value.body));
        emit(qualitypoststudentdistributionsuccessstate());
        return modelStudentdistribution;
      } else {
        throw Exception('Failed to post student distribution.');
      }
    }).catchError((error) {
      emit(qualitypoststudentdistributionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentDistribution?> PutStudentDistribution(
      {int? id,
        int? year,
        int? level,
        String? male,
        String? female,
        String? cs,
        String? Is,
        String? ai,
        String? ni,
        String? general}) async {
    emit(qualityputstudentdistributionloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-distributions/${id}?populate=*';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Level": level,
            "Male": "${male}",
            "Female": "${female}",
            "year": year,
            "CS": {"Number": "${cs}"},
            "IS": {"Number": "${Is}"},
            "AI": {"Number": "${ai}"},
            "NI": {"Number": "${ni}"},
            "General": {"Number": "${general}"}
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelStudentdistribution =
            StudentDistribution.fromJson(jsonDecode(value.body));
        emit(qualityputstudentdistributionsuccessstate());
        return modelStudentdistribution;
      } else {
        throw Exception('Failed to put student distribution.');
      }
    }).catchError((error) {
      emit(qualityputstudentdistributionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentDistribution?> DeleteStudentDistrubtion({int? id}) async {
    emit(qualitydeletestudentdistributionloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/student-distributions/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelStudentdistribution =
            StudentDistribution.fromJson(jsonDecode(value.body));
        emit(qualitydeletestudentdistributionsuccessstate());
        return modelStudentdistribution;
      } else {
        throw Exception('failed to delete student distrbution data');
      }
    }).catchError((error) {
      emit(qualitydeletestudentdistributionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  StudentTransaction? modelstudenttransaction;

  Future<StudentTransaction?> PostStudentTransaction(
      {int? percentage, int? year, int? survey}) async {
    emit(qualitypoststudenttransactionloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-transactions?populate=*';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Percentage": percentage,
            "academic_year": year,
            "survey_item": survey
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelstudenttransaction =
            StudentTransaction.fromJson(jsonDecode(value.body));
        emit(qualitypoststudenttransactionsuccessstate());
        return modelstudenttransaction;
      } else {
        throw Exception('Failed to post student trasaction.');
      }
    }).catchError((error) {
      emit(qualitypoststudenttransactionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentTransaction?> PutStudentTransaction(
      {int? id, int? percentage, int? year, int? survey}) async {
    emit(qualityputstudenttransactionloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/student-transactions/${id}?populate=*';
    http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Percentage": percentage,
            "academic_year": year,
            "survey_item": survey
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelstudenttransaction =
            StudentTransaction.fromJson(jsonDecode(value.body));
        emit(qualityputstudenttransactionsuccessstate());
        return modelstudenttransaction;
      } else {
        throw Exception('Failed to put student trasaction.');
      }
    }).catchError((error) {
      emit(qualityputstudenttransactionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<StudentTransaction?> DeleteStudentTransaction({int? id}) async {
    emit(qualitydeletestudenttransactionloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/student-transactions/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelstudenttransaction =
            StudentTransaction.fromJson(jsonDecode(value.body));
        emit(qualitydeletestudenttransactionsuccessstate());
        return modelstudenttransaction;
      } else {
        throw Exception('failed to delete student transaction data');
      }
    }).catchError((error) {
      emit(qualitydeletestudenttransactionerrorstate(error.toString()));
      print(error.toString());
    });
  }

  SurveyItems? modelsurveyitems;

  Future<SurveyItems?> PostSurveyItem(
      {String? describtion, int? survey}) async {
    emit(qualitypostsurveyitemloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/survey-items?populate=*';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Description": "${describtion.toString()}",
            "survey": survey
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelsurveyitems = SurveyItems.fromJson(jsonDecode(value.body));
        emit(qualitypostsurveyitemsuccessstate());
        return modelsurveyitems;
      } else {
        throw Exception('Failed to post survey items.');
      }
    }).catchError((error) {
      emit(qualitypostsurveyitemerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<SurveyItems?> PutSurveyItem(
      {int? id, String? describtion, int? survey}) async {
    emit(qualityputsurveyitemloadingstate());
    dynamic api =
        'https://qms-application.herokuapp.com/api/survey-items/${id}?populate=*';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {
            "Description": "${describtion.toString()}",
            "survey": survey
          }
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelsurveyitems = SurveyItems.fromJson(jsonDecode(value.body));
        emit(qualityputsurveyitemsuccessstate());
        return modelsurveyitems;
      } else {
        throw Exception('Failed to put survey items.');
      }
    }).catchError((error) {
      emit(qualityputsurveyitemerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<SurveyItems?> DeleteSurveyItem({int? id}) async {
    emit(qualitydeletesurveyitemloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/survey-items/${id}?populate=*'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        SurveyItems.fromJson(jsonDecode(value.body));
        emit(qualitydeletesurveyitemsuccessstate());
        return modelsurveyitems;
      } else {
        throw Exception('failed to delete survey item data');
      }
    }).catchError((error) {
      emit(qualitydeletesurveyitemerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Surveys? modelsurveys;

  Future<Surveys?> PostSurvey({String? Stype}) async {
    emit(qualitypostsurveyloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/surveys';
    await http
        .post((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"sType": "${Stype}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelsurveys = Surveys.fromJson(jsonDecode(value.body));
        emit(qualitypostsurveysuccessstate());
        return modelsurveys;
      } else {
        throw Exception('Failed to post survey.');
      }
    }).catchError((error) {
      emit(qualitypostsurveyerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Surveys?> PutSurvey({int? id, String? Stype}) async {
    emit(qualityputsurveyloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/surveys/${id}';
    await http
        .put((Uri.parse(api)),
        headers: <String, String>{
          //'Authorization' : 'xyz',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "data": {"sType": "${Stype}"}
        }))
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
        modelsurveys = Surveys.fromJson(jsonDecode(value.body));
        emit(qualityputsurveysuccessstate());
        return modelsurveys;
      } else {
        throw Exception('Failed to put survey.');
      }
    }).catchError((error) {
      emit(qualityputsurveyerrorstate(error.toString()));
      print(error.toString());
    });
  }

  Future<Surveys?> DeleteSurvey({int? id}) async {
    emit(qualitydeletesurveyloadingstate());
    await http
        .delete(Uri.parse(
        'https://qms-application.herokuapp.com/api/surveys/${id}'))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        modelsurveys = Surveys.fromJson(jsonDecode(value.body));
        emit(qualitydeletesurveysuccessstate());
        return modelsurveys;
      } else {
        throw Exception('failed to delete survey data');
      }
    }).catchError((error) {
      emit(qualitydeletesurveyerrorstate(error.toString()));
      print(error.toString());
    });
  }
}