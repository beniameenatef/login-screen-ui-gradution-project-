import 'package:design_ui/models/yearsmodel.dart';
import 'package:design_ui/network/http/http2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class years extends StatefulWidget {
  const years({Key? key}) : super(key: key);

  @override
  _yearsState createState() => _yearsState();
}

class _yearsState extends State<years> {
  late Future<Year> year;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = GetYears();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Year>(
          future: year,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<YearDatum?>? Yearinfo = snapshot.data!.data!;
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:ListView.builder(
                    itemCount: Yearinfo.length,
                      itemBuilder: (context, index) {
                    return  Column(children:[
                          Text(Yearinfo[0]!.attributes!.year.toString()),
                          Text(Yearinfo[0]!.attributes!.graduatedNumber!.data!.attributes!.number.toString()),
                          Text(Yearinfo[0]!.attributes!.graduatedNumber!.data!.attributes!.cs![0].number.toString()),
                          Text(Yearinfo[0]!.attributes!.graduatedNumber!.data!.attributes!.attributesIs![0].number.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.name.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.impact.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.journalName.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.aStaff!.data!.attributes!.name.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.aStaff!.data!.attributes!.job.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.majorOfResearch!.data!.attributes!.researchName.toString()),
                          Text(Yearinfo[0]!.attributes!.research!.data![0].attributes!.majorOfResearch!.data!.attributes!.field.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.level.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.female.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.male.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.level.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.female.toString()),
                          Text(Yearinfo[0]!.attributes!.studentDistributions!.data![0].attributes!.male.toString()),
                          Text(Yearinfo[0]!.attributes!.studentTransaction!.data!.attributes!.total.toString()),
                          Text(Yearinfo[0]!.attributes!.studentTransaction!.data!.attributes!.percentage.toString()),
                          Text(Yearinfo[0]!.attributes!.studentTransaction!.data!.attributes!.surveyItems!.data![0].attributes!.description.toString()),
                          Text(Yearinfo[0]!.attributes!.studentTransaction!.data!.attributes!.surveyItems!.data![0].attributes!.sid!.data!.attributes!.sType.toString()),
                          Text(Yearinfo[0]!.attributes!.studentTransaction!.data!.attributes!.surveyItems!.data![0].attributes!.sid!.data!.attributes!.field.toString()),


                    ]);
                  }));
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(color: Colors.pinkAccent,),
                    Text('LOADING'),
                  ],
                ),
              );
            }
          },
        ));


  }
}