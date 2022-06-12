import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/models/yearsmodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../constant/colors.dart';
import '../../../../models/graduatednumbrmodel.dart';
import '../../../../models/labmodel.dart';
import '../../../../models/studentdistribution.dart';
import '../../../../network/http/HttpGet.dart';
class Homecharts extends StatefulWidget {
  const Homecharts({Key? key}) : super(key: key);

  @override
  State<Homecharts> createState() => _HomechartsState();
}

class _HomechartsState extends State<Homecharts> {
  late Future<GraduatedNumber> graduatednumber;
  late Future<Library> library;
  late Future<Lab> lab;
  late Future<Year> year;
  late Future<StudentDistribution> studentdistrubution;
  late Future<StudentActivity> studentactivity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    graduatednumber= GetGraduatedNumbers();
    library=GetLibrary();
    lab=GetLab();
    year=GetYears();
    studentdistrubution=GetStudentDistrubtion();
    studentactivity=GetStudentActivity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: FutureBuilder(
          future: Future.wait([graduatednumber,library,lab,year,studentactivity]),
          builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              // List<Datum> data=[];
              // List.generate(snapshot.data!.data!.length, (index) {
              //   final x = snapshot.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
              //   dynamic y = snapshot.data!.data![index].attributes!.cs!.number.toString();
              //
              //   return data;
              // });
              // print(data);
              List<DatumG> grad=snapshot.data![0]!.data;
              List<Datum> library=snapshot.data![1]!.data;
              List<Datumlab> lab=snapshot.data![2]!.data;
              List<YearData> year=snapshot.data![3].data;
              List<DatumSA> stuacti=snapshot.data![4]!.data;






              return SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    //Initialize the chart widget
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                            labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                        ),
                        // Chart title
                        title: ChartTitle(text: ' أعداد الخريجين لاخر اربع سنوات'),
                        // Enable legend
                        legend: Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<DatumG, String>>[
                          LineSeries<DatumG, String>(
                              dataSource: grad,
                              xValueMapper: (DatumG num, _) => num.attributes!.academicYear!.data!.attributes!.year,
                              yValueMapper: (DatumG num, _) => int.parse(num.attributes!.cs!.number.toString()),

                              name: 'CS student',
                              // Enable data label
                              dataLabelSettings: DataLabelSettings(isVisible: true)),
                          LineSeries<DatumG, String>(
                              dataSource: grad,
                              xValueMapper: (DatumG num, _) => num.attributes!.academicYear!.data!.attributes!.year,
                              yValueMapper: (DatumG num, _) => int.parse(num.attributes!.attributesIs!.number.toString()),

                              name: 'IS student',
                              // Enable data label
                              dataLabelSettings: DataLabelSettings(isVisible: true)),
                          LineSeries<DatumG, String>(
                              dataSource: grad,
                              xValueMapper: (DatumG num, _) => num.attributes!.academicYear!.data!.attributes!.year,
                              yValueMapper: (DatumG num, _) => int.parse(num.attributes!.ai!.number.toString()),

                              name: 'AI student',
                              // Enable data label
                              dataLabelSettings: DataLabelSettings(isVisible: true)),
                          LineSeries<DatumG, String>(
                              dataSource: grad,
                              xValueMapper: (DatumG num, _) => num.attributes!.academicYear!.data!.attributes!.year,
                              yValueMapper: (DatumG num, _) => int.parse(num.attributes!.ni!.number.toString()),

                              name: 'NI student',
                              // Enable data label
                              dataLabelSettings: DataLabelSettings(isVisible: true)),

                        ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.hide,
                        maximumLabelWidth: 80,

                        //labelRotation: 280

                      ),
                      // Chart title
                      title: ChartTitle(text: ' أعداد الكتب لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<Datum, String>>[
                        BarSeries<Datum, String>(
                            dataSource: library,
                            xValueMapper: (Datum num, _) => num.attributes!.bookType!.data!.attributes!.type,
                            yValueMapper: (Datum num, _) => int.parse(num.attributes!.number.toString()),

                            name: '',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),

                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                          labelRotation: 280

                      ),
                      // Chart title
                      title: ChartTitle(text: ' أعداد ألاجهزة فى المعامل'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<Datumlab, String>>[
                        LineSeries<Datumlab, String>(
                            dataSource: lab,
                            xValueMapper: (Datumlab num, _) => num.attributes!.labNumber,
                            yValueMapper: (Datumlab num, _) => int.parse(num.attributes!.pCnumber.toString()),

                            name: 'PC Numbers',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),

                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                          labelRotation: 280

                      ),
                      // Chart title
                      title: ChartTitle(text: 'أعداد الابحاث لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<YearData, String>>[
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.research!.data!.length.toString()),

                            name: 'Research Numbers',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),

                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                      ),
                      // Chart title
                      title: ChartTitle(text: '  توزيع طلاب الفرقة الاولى لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<YearData, String>>[
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.Male.toString()),

                            name: 'male student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.Female!.toString()),

                            name: 'female student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.CS!.Number.toString()),

                            name: 'CS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.IS!.Number.toString()),

                            name: 'IS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.AI!.Number.toString()),

                            name: 'AI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.NI!.Number.toString()),

                            name: 'NI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.General!.Number.toString()),

                            name: 'General student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),



                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                      ),
                      // Chart title
                      title: ChartTitle(text: '  توزيع طلاب الفرقة الثانية لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<YearData, String>>[
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.Male.toString()),

                            name: 'male student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.Female!.toString()),

                            name: 'female student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.CS!.Number.toString()),

                            name: 'CS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.IS!.Number.toString()),

                            name: 'IS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.AI!.Number.toString()),

                            name: 'AI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.NI!.Number.toString()),

                            name: 'NI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.General!.Number.toString()),

                            name: 'General student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),



                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                      ),
                      // Chart title
                      title: ChartTitle(text: '  توزيع طلاب الفرقة الثالثة لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<YearData, String>>[
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.Male.toString()),

                            name: 'male student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.Female!.toString()),

                            name: 'female student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.CS!.Number.toString()),

                            name: 'CS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.IS!.Number.toString()),

                            name: 'IS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.AI!.Number.toString()),

                            name: 'AI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.NI!.Number.toString()),

                            name: 'NI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.General!.Number.toString()),

                            name: 'General student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),



                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                      ),
                      // Chart title
                      title: ChartTitle(text: '  توزيع طلاب الفرقة الرابعه لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<YearData, String>>[
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.Male.toString()),

                            name: 'male student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year.toString(),
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.Female!.toString()),

                            name: 'female student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.CS!.Number.toString()),

                            name: 'CS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.IS!.Number.toString()),

                            name: 'IS student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.AI!.Number.toString()),

                            name: 'AI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.NI!.Number.toString()),

                            name: 'NI student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),
                        LineSeries<YearData, String>(
                            dataSource: year,
                            xValueMapper: (YearData num, _) => num.attributes!.Year,
                            yValueMapper: (YearData num, _) => int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.General!.Number.toString()),

                            name: 'General student',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),



                      ],
                    ),
                    Divider(thickness: 2,color: AppColors.orange,),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.hide,
                        maximumLabelWidth: 80,

                        //labelRotation: 280

                      ),
                      // Chart title
                      title: ChartTitle(text: 'ألانشطة لأخر اربع سنوات'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<DatumSA, String>>[
                        BarSeries<DatumSA, String>(
                            dataSource: stuacti,
                            xValueMapper: (DatumSA num, _) => num.attributes!.year!.data!.attributes!.year,
                            yValueMapper: (DatumSA num, _) => int.parse(num.attributes!.total.toString()),

                            name: '',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true)),

                      ],
                    ),















                  ]),
                ),
              );
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                    Text('تحميل'),
                  ],
                ),
              );
            }
          },
        ),
    );}
}



// class _SalesData {
//   _SalesData(this.year, this.sales);
//
//   final String year;
//   final double sales;
// }