
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/login/login.dart';
import 'package:design_ui/modules/on%20boarding/classes.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';




class onBoardingScrean extends StatelessWidget {
  List <boardingmodel> boarding=
  [
    boardingmodel(
        image: 'assets/image/qualitylogo.jpg',
        text: 'text1',
        body: "body1"),
    boardingmodel(
        image: 'assets/image/qualitylogo.jpg',
        text: "text2",
        body: "body2"),
    boardingmodel(
        image: 'assets/image/qualitylogo.jpg',
        text: 'text3',
        body: "body3"),
  ];
  var boardcontroller=PageController();
  bool islast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blue,
        // title: Text('hello=>'),
        actions: [TextButton(onPressed: ()
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => loginqualityapp()));
        }, child: const Padding(
          padding: EdgeInsetsDirectional.only(end: 20),
          child: Text('Skip>',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),)],

      ),
      body:Column(
        children: [

          Expanded(
            child: PageView.builder(itemBuilder: (context,index)
            =>buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              controller:boardcontroller,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index)
              {
                if (index == boarding.length-1)
                {
                  islast=true;
                }
                else
                {
                  islast=false;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [

                SmoothPageIndicator(controller: boardcontroller, count: boarding.length,
                  effect:const ExpandingDotsEffect(
                    dotColor:Colors.grey ,
                    dotHeight:10 ,
                    dotWidth:10 ,
                    expansionFactor: 4,
                    activeDotColor: AppColors.orange,
                    spacing: 5,

                  ) ,),
                Spacer(),

                FloatingActionButton(backgroundColor: AppColors.blue,
                  onPressed: (){
                    boardcontroller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                    if(islast)
                    {
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => loginqualityapp()),
                      );
                    }
                  },
                  child:Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ),
        ],
      ) ,
    );

  }
  // void navigateandfinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) => loginsocialapp()),
  //         (Route<dynamic>route) => false);

  Widget buildBoardingItem(boardingmodel model)=>  Column(children: [
    Expanded(child: Image(image: AssetImage('${model.image}'),width:100,height: 100,)),
    Text('${model.text}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),

    Text('${model.body}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
  ],);
}
