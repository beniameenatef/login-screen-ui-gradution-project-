import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawer/modules/screenpagedrawer/اداره  الجوده والتطوير.dart';


class AppDrawer extends StatefulWidget {
  final Widget child;

  AppDrawer({key, required this.child}) : super(key: key);

  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF054978),
      child: SafeArea(
        child: Theme(
            data: ThemeData(
              brightness: Brightness.dark,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 52, bottom: 30),
                        // child: Image(image: AssetImage('assets/images/EllipseMorado.png'),),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            // backgroundImage:
                            // AssetImage(''),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'beniameen atef naiem',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF1770D)),
                          ),
                          Text(
                            'beniameen11gmail.com',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          )
                        ],
                      )),
                  // SizedBox(height: 5,),

                  Container(
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: Divider(
                          height: 20,
                          color: Color(0xfff4f4f8),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'أدارة الجودة',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                            )
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'المشاركة الاجتماعية',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'الطلاب والخرجين',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                              size: 25,
                            )
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'البحث العلمي ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'الخطة الاستراتيجية',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              ' الجهاز الادارى',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'تطور اعداد الخرجين',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'الموارد المالية',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'الطلاب الوافدين ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'الطلاب المتفوقين ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              'المصداقية والاخلاقيات',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adaretalgouda()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: const [
                            Text(
                              ' الرضا الطلابى',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Icon(Icons.arrow_right_rounded)
                          ],
                        ),
                      )),

                  Container(
                      width: 250,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 74, right: 0),
                        child: Divider(
                          color: Color(0xfff4f4f8),
                        ),
                      )),
                  const ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Settings'),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   child: Image(image: AssetImage('assets/images/EllipseMorado.png'),),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.only(left:38,top:17,bottom:80),
                  //   alignment: Alignment.centerLeft,
                  //   child: Image(image: AssetImage('assets/images/circulomoradorelleno.png'),),
                  // ),
                  const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Sign Out'),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
