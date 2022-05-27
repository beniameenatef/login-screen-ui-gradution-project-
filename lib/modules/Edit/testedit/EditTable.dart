

import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/modules/Edit/testedit/scroll.dart';
import 'package:design_ui/modules/Edit/testedit/textdialog.dart';
import 'package:design_ui/modules/Edit/testedit/utils.dart';
import 'package:flutter/material.dart';



class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<Library> library;

  @override
  void initState() {
    super.initState();

    library = GetLibrary();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ScrollableWidget(child: buildDataTable()),
  );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Age'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(library),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Library> users) => library.map((Library library) {
    final cells = [
      library.data.,
      user.lastName,
      user.age];

    return DataRow(
      cells: Utils.modelBuilder(cells, (index, cell) {
        final showEditIcon = index == 0 || index == 1;

        return DataCell(
          Text('$cell'),
          showEditIcon: showEditIcon,
          onTap: () {
            switch (index) {
              case 0:
                editFirstName(library);
                break;
              case 1:
                editLastName(library);
                break;
            }
          },
        );
      }),
    );
  }).toList();

  Future editFirstName(Library editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.firstName,
    );

    setState(() => library = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(firstName: firstName) : user;
    }).toList());
  }

  Future editLastName(User editUser) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editUser.lastName,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(lastName: lastName) : user;
    }).toList());
  }
}
