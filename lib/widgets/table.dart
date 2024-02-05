part of "./widget.dart";

class TableWidget extends StatelessWidget {
  final Panel dataWidget;
  const TableWidget({
    Key? key,
    required this.dataWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = dataWidget.fields.map((e) {
      return DataColumn(
        label: Expanded(
          child: Text(
            e.fieldLabel,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
    List<DataRow> rows = dataWidget.rowsTable!.map((e) {
      return DataRow(cells: e.map((value) => DataCell(Text(value))).toList()
          // <DataCell>[
          //   DataCell(Text("")),
          //   DataCell(Text("")),
          //   DataCell(Text("")),
          // ],
          );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: const Color.fromARGB(255, 25, 25, 25),
            width: 1.0,
          ),
        ),
        child: DataTable(
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
          columns: columns,
          showBottomBorder: true,
          rows: rows,
        ),
      ),
    );
  }
}
