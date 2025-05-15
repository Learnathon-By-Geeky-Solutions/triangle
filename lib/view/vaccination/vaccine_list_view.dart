import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class VaccineListView extends StatelessWidget {
  const VaccineListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.hourglass_bottom_rounded),
                const SizedBox(width: Sizes.xs),
                Text("Upcoming Vaccine Doses",
                  style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: Sizes.sm),

            Expanded(
              child: DataTable2(              
                columns: [
                  DataColumn2(
                    label: Text("Vaccines",
                    style: Theme.of(context).textTheme.titleMedium)),
                  DataColumn(
                    label: Text("Due Age",
                    style: Theme.of(context).textTheme.titleMedium)),
                  DataColumn(
                    label: Text("Status",
                    style: Theme.of(context).textTheme.titleMedium)),
                ], 
                rows: List.generate(10, (index) {
                  return DataRow(cells: [
                    DataCell(Text("Vaccine $index")),
                    DataCell(Text("Age $index")),
                    DataCell(Text("Status $index")),
                  ]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

