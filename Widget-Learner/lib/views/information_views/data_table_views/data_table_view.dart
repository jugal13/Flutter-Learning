import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class DataTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'DataTable',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/data_table_views/data_table_view.dart',
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                "Column1",
              ),
            ),
            DataColumn(
              label: Text(
                "Column2",
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "1",
                  ),
                ),
                DataCell(
                  Text(
                    "cell 1",
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "2",
                  ),
                ),
                DataCell(
                  Text(
                    "cell 2",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
