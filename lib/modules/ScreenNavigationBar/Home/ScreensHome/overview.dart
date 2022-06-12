import 'package:design_ui/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../models/modelMaktba.dart';
import '../../../../models/modelStaff.dart';
import '../../../../models/yearsmodel.dart';
import '../../../../network/http/HttpGet.dart';

class Homeoverview extends StatefulWidget {
  const Homeoverview({Key? key}) : super(key: key);



  @override
  State<Homeoverview> createState() => _HomeoverviewState();
}

class _HomeoverviewState extends State<Homeoverview> {
  late Future<Year> year;
  late Future<Library> library;
  late Future<Astaff> astaff;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    library=GetLibrary();
    year=GetYears();
    astaff =GetAstaff();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([library,year,astaff]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          //List<?>? Yearinfo = snapshot.data!.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("الخطة الإستراتيجية للكلية ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("متابعة الخطة التنفيذية لتطبيق استراتيجية الكلية ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  Text("تهتم الكلية بتحقيق الغايات النهائية والأهداف الاستراتيجية حيث شملت الخطة التنفيذية كافة العناصر الأساسية مثل الأهداف الاستراتيجية، وبرامج العمل والأنشطة التى تحققها، مسئولية التنفيذ طبقا للمسئوليات المحددة بالهيكل التنظيمي والتوصيف الوظيفي ، الجدول الزمني للتنفيذ، الميزانية المقترحة، ومؤشرات الأداء لكل نشاط، كما تضمنت أيضا آليات التنفيذ والمتابعة والتقييم لجميع مراحل تنفيذ الخطة ",
                    textAlign: TextAlign.end,),
                  SizedBox(height: 10,),
                  Text("القيادة والحوكمة  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("تطرح الكلية سنوياً نموذج استطلاع رأي اعضاء هيئه التدريس والهيئه المعاونه عن نمط القياده، كما تطرح نموذج استطلاع رأي الجهاز الاداري عن نمط القياده  ",
                    textAlign: TextAlign.end,),
                  SizedBox(height: 10,),
                  Text("المصداقية والآخلاقيات   ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text(
                    '''
١.إستمرارية التوعية بدليل حقوق الملكية الفكرية الصادر على مستوى الجامعة

٢.عقد ورش عمل عن حقوق الملكيه الفكريه للآطراف المختلفة داخل الكلية 

٣.القياس الدورى لإنطباعات الأطراف المعنية عن فاعلية الإجراءات
 التى تتبعها الكلية لحماية الملكية الفكرية، وذلك عن طريق استبيان رضا أعضاء هيئة التدريس، وقد أظهرت نتائج التحليل أن حوالي(82%) من المشاركين موافقين على فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية وأهميتها لديهم. وتتخذ الكلية في ضوء نتائج هذا الاستبيان الإجراءات التصحيحية اللازمة وفق نتائج القياس 

                     ''',
                    textAlign: TextAlign.end,),
                  Text("المكتبة المركزية بجامعة 6 أكتوبر    ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(":الكتب والمراجع الدورية",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  DataTable(
                    columnSpacing: 38.0,
                    columns: [
                      DataColumn(label: Text('Year')),
                      DataColumn(label: Text('Book Type')),
                      DataColumn(label: Text('Number')),
                    ],
                    rows: List.generate(snapshot.data![0].data.length, (index) {
                      final y = snapshot.data![0]!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
                      final x = snapshot.data![0].data![index].attributes!.bookType!.data!.attributes!.type.toString();
                      final z = snapshot.data![0].data![index].attributes!.number;
                      //final z = snapshot.data![2].data[index].attributes.job;


                      return DataRow(cells: [
                        DataCell(Container(width: 75, child: Text("${y}"))),
                        DataCell(Container(child: Text('${x}'))),
                        DataCell(Container(child: Text('${z}')))
                      ]);
                    }),),
                  SizedBox(height: 30,),
                  Text("موقع الكلية الإلكترونى ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(''' للكلية موقع على شبكة الإنترنت باللغتين العربية والإنجليزية
                  تم تحديث كامل محتوى موقعها الإلكتروني وبقالب تصميم عصري حديث يناسب طبيعة عملها ومكانتها الأكاديمية ويشتمل على جميع المعلومات الأساسية والأنشطة والخدمات المقدمة ويغطي الموقع البيانات الأساسية عن الكلية والأنشطة المختلفة، ويتم تحديث هذا الموقع بصفه دورية من خلال مسئول متابعة وتحديث الموقع الإلكتروني بالكلية بالتعاون مع إدارة المعلوماتية بالجامعة.
                    ''',
                    textAlign: TextAlign.end,),
                  Text("قواعد البيانات  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("موقع خاص بنظام التسجيل الإلكتروني  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  Text("يوجد موقع خاص بنظام التسجيل الإلكتروني والإرشاد الأكاديمي للطلاب  ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  SizedBox(height: 10,),
                  Text(
                    ''' 
قواعد بيانات شئون الطلبة- 
قواعد بيانات المكتبه المركزية- 
شبكه اتصالات مركزية للجامعة- 	
قواعد بيانات الكنترول والنتائج- 
نظام حضور وانصراف العاملين- 
قواعد بيانات شئون اعضاء الهيئة التدريسية-
                    
                    
                    ''',
                    textAlign: TextAlign.end,),













                ],),
            ),
          );

        }
        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        else
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.blue,),
                Text('تحميل'),
              ],
            ),
          );
      },
    );
  }
}
