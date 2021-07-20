import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Table Widget',
          ),
        ),
        body: Center(
          child: TableWidget(),
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        defaultColumnWidth: FixedColumnWidth(50.0),
        border: TableBorder.all(color: Colors.transparent),
        children: [
          _buildTableRow(['1','2','3','4','5','6','7']),
          _buildTableRow(['8','9','10','11','12','13','14']),
          _buildTableRow(['15','16','17','18','19','20','21']),
          _buildTableRow(['22','23','24','25','26','27','28']),
          _buildTableRow(['30','31','32','33','34','35','36']),
        ]
      ),
    );
  }

  TableRow _buildTableRow(List<String> data) {
    final List<TableCell> cells = [];
    for (int i = 0; i < 7; i++) {
      cells.add(_buildTableCell(data[i]));
    }
    return TableRow(
      children: cells,
    );
  }

  TableCell _buildTableCell(String str) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.all(14.5),
        child: Text(
          str,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}