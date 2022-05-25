// import 'package:flutter/material.dart';
//
// class tables extends StatelessWidget {
//   const tables({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Column(children: <Widget>[
//               Container(
//                 margin: EdgeInsets.all(20),
//                 child: Table(
//                   border: TableBorder.all(),
//                   children: [
//                     TableRow( children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Icon(Icons.cake,),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Icon(Icons.voice_chat,),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Icon(Icons.add_location, ),
//                       ),
//                     ]),
//                     TableRow( children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(children:[
//                           Icon(Icons.account_box, ),
//                           Text('My Account')
//
//                         ]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(children:[
//                           Icon(Icons.settings, ),
//                           Text('Settings')
//                         ]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(children:[
//                           Icon(Icons.lightbulb_outline,),
//                           Text('Ideas')
//                         ]),
//                       ),
//                     ]),
//
//                   ],
//                 ),
//               ),
//             ])));
//   }
// }
//
//
//
//
import 'package:flutter/material.dart';

// class LandingPage extends StatefulWidget {
//   final columns = 10;
//   final rows = 20;
//
//   List<List<String>> makeData() {
//     final List<List<String>> output = [];
//     for (int i = 0; i < columns; i++) {
//       final List<String> row = [];
//       for (int j = 0; j < rows; j++) {
//         row.add('L$j : T$i');
//       }
//       output.add(row);
//     }
//     return output;
//   }
//
//   /// Simple generator for column title
//   List<String> makeTitleColumn() => List.generate(columns, (i) => 'Top $i');
//
//   /// Simple generator for row title
//   List<String> makeTitleRow() => List.generate(rows, (i) => 'Left $i');
//
//   @override
//   _LandingPageState createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//   int _selectedIndex = 0;
//
//   // Widget _widgetOptions(int index) {
//   //   switch (index) {
//   //     case 0:
//   //       return SimpleTablePage(
//   //         titleColumn: widget.makeTitleColumn(),
//   //         titleRow: widget.makeTitleRow(),
//   //         data: widget.makeData(),
//   //       );
//   //     case 1:
//   //       return TapHandlerPage(
//   //         titleColumn: widget.makeTitleColumn(),
//   //         titleRow: widget.makeTitleRow(),
//   //         data: widget.makeData(),
//   //       );
//   //     case 2:
//   //       return DecoratedTablePage(
//   //         titleColumn: widget.makeTitleColumn(),
//   //         titleRow: widget.makeTitleRow(),
//   //         data: widget.makeData(),
//   //       );
//   //     default:
//   //       print('$index not supported');
//   //       return Container();
//   //   }
//   // }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Container(),
//             label: 'Simple',
//           ),
//           BottomNavigationBarItem(
//             icon: Container(),
//             label: 'Tap Handler',
//           ),
//           BottomNavigationBarItem(
//             icon: Container(),
//             label: 'Decorated',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Tables(),
    );
  }
}

class Tables extends StatelessWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
}
