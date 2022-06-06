// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GeeksforGeeks',
//
//       // to hide debug banner
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// /// [StatefulWidget] so that we can change
// /// internal state to show proper working
// /// of [PULL TO REFRESH] feature
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
// // ScaffoldKey object. This is required
// // to show snackbar
// // This is optional. This is not required always
//   GlobalKey<ScaffoldState> ?_scaffoldKey;
//
// // Local State to display items in listview
//   List<String> ?_demoData;
//
// // This method will run once widget is loaded
// // i.e when widget is mounting
//   @override
//   void initState() {
//     // initializing states
//     _demoData = [
//       "Flutter",
//       "React Native",
//       "Cordova/ PhoneGap",
//       "Native Script"
//     ];
//     _scaffoldKey = GlobalKey();
//     super.initState();
//   }
//
// // This method will run when widget is unmounting
//   @override
//   void dispose() {
//     // disposing states
//     _scaffoldKey?.currentState?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text('GeeksforGeeks'),
//         ),
//         // Widget to show RefreshIndicator
//         body: RefreshIndicator(
//           child: ListView.builder(
//             itemBuilder: (ctx, idx) {
//               // List Item
//               return Card(
//                 child: ListTile(
//                   title: Text(_demoData![idx]),
//                 ),
//               );
//             },
//
//             // Length of the list
//             itemCount: _demoData!.length,
//
//             // To make listView scrollable
//             // even if there is only a single item.
//             physics: const AlwaysScrollableScrollPhysics(),
//           ),
//           // Function that will be called when
//           // user pulls the ListView downward
//           onRefresh: () {
//             return Future.delayed(
//               Duration(seconds: 1),
//                   () {
//                 setState(() {
//                   _demoData!.addAll(["Ionic", "Xamarin"]);
//                 });
//
//                 // showing snackbar
//                 _scaffoldKey!.currentState!.showSnackBar(
//                   SnackBar(
//                     content: const Text('Page Refreshed'),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
