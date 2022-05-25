import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/modules/Drawer/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class AppDrawer extends StatefulWidget {
  final Widget child;
  AppDrawer({key, required this.child}) : super(key: key);

  static _AppDrawerState? of(BuildContext context) => context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open () => _controller.forward();

  void toggle () {
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
    bool isDraggingFromLeft = _controller.isDismissed && startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted && startDetails.globalPosition.dx > dragLeftStartVal;
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
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
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
          double scaleVal = 1 - (animationVal *  0.3);
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
                    child: widget.child
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen>
//     with SingleTickerProviderStateMixin {
//   bool isCollapsed = true;
//   double? screenWidth, screenHeight;
//   var searchtext = TextEditingController();
//
//   final Duration duration = const Duration(milliseconds: 500);
//   AnimationController ?_controller;
//
//   AppBar appBar = AppBar();
//   double borderRadius = 0.0;
//
//   int _navBarIndex = 0;
//   TabController? tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: duration);
//   }
//
//   @override
//   void dispose() {
//     _controller!.dispose();
//     tabController = TabController(length: 4, vsync: this);
//     tabController!.addListener(() {
//       setState(() {
//         _navBarIndex = tabController!.index;
//       });
//     });
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     screenHeight = size.height;
//     screenWidth = size.width;
//
//     return WillPopScope(
//       onWillPop: () async {
//         if (!isCollapsed) {
//           setState(() {
//             _controller!.reverse();
//             borderRadius = 0.0;
//             isCollapsed = !isCollapsed;
//           });
//           return false;
//         } else
//           return true;
//       },
//       child: Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         body: Stack(
//           children: <Widget>[
//             menu(context),
//             AnimatedPositioned(
//                 left: isCollapsed ? 0 : 0.6 * screenWidth!,
//                 right: isCollapsed ? 0 : -0.2 * screenWidth!,
//                 top: isCollapsed ? 0 : screenHeight! * 0.1,
//                 bottom: isCollapsed ? 0 : screenHeight! * 0.1,
//                 duration: duration,
//                 curve: Curves.fastOutSlowIn,
//                 child: dashboard(context)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget menu(context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 32.0),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: FractionallySizedBox(
//             widthFactor: 0.6,
//             heightFactor: 0.8,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:[  Expanded(child: CustomDrawer())]
//             ),
//           ),
//         ),
//       ),
//     );
//     // ),
//     // )
//   }
//
//   Widget dashboard(context) {
//     return SafeArea(
//       child: Material(
//         borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//         type: MaterialType.card,
//         animationDuration: duration,
//         color: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 8,
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white24,
//               elevation: 0,
//               bottomOpacity: 0,
//               toolbarHeight: 80,
//               titleSpacing: 0,
//               title: Padding(padding: EdgeInsetsDirectional.only(end: 10),
//               child: Row(
//                 children: [
//                   const Text(
//                     'QMS',
//                     style: TextStyle(color: Color(0xFFF1770D)),
//                   ),
//
//                   SizedBox(
//                       width: 250.0,
//                       height: 37,
//                       child: TextField(
//                         onTap: () {
//                           // Navigator.of(context).push(
//                           //   MaterialPageRoute(
//                           //       builder: (context) => SearchScreen()),
//                           // );
//                         },
//                         onSubmitted: (value) {},
//                         decoration: InputDecoration(
//                           hintText: 'searching',
//                           hintStyle: TextStyle(fontSize: 15, height: 2.7),
//                           // hintText: "Search",
//
//                           prefixIcon: const Icon(
//                             Icons.search,
//                             color: Colors.black,
//                             size: 18,
//                           ),
//
//                           suffixIcon: searchtext.text.isNotEmpty
//                               ? IconButton(
//                             iconSize: 18,
//                             icon: Icon(Icons.clear),
//                             onPressed: () {},
//                           )
//                               : null,
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(50.0),
//                             ),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),),
//               leading: IconButton(
//                   icon: AnimatedIcon(color: Colors.red,
//                     icon: AnimatedIcons.menu_close,
//                     progress: _controller!,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       if (isCollapsed) {
//                         _controller!.forward();
//
//                         borderRadius = 16.0;
//                       } else {
//                         _controller!.reverse();
//
//                         borderRadius = 0.0;
//                       }
//
//                       isCollapsed = !isCollapsed;
//                     });
//                   }),
//             ),
//
//             body: detailshomePage(),
//           ),
//         ),
//       ),
//     );
//   }
// }