import 'package:flutter/material.dart';
// https://fluttergems.dev/table/
class InventoryLevelsReport extends StatefulWidget {
  const InventoryLevelsReport({super.key});

  @override
  State<InventoryLevelsReport> createState() => _InventoryLevelsReportState();
}

class _InventoryLevelsReportState extends State<InventoryLevelsReport> {
  final List<Map<String, dynamic>> feedData = [
    {
      'feedName': 'Feed 1',
      'feedType': 'Type 1',
      'feedQuantity': '100 kg',
      'feedCost': '\$50',
      'reorderLevel': '10 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-06-14',
    },
    {
      'feedName': 'Feed 2',
      'feedType': 'Type 2',
      'feedQuantity': '50 kg',
      'feedCost': '\$30',
      'reorderLevel': '15 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-06-12',
    },
    {
      'feedName': 'Feed 3',
      'feedType': 'Type 1',
      'feedQuantity': '200 kg',
      'feedCost': '\$100',
      'reorderLevel': '20 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-06-10',
    },
    {
      'feedName': 'Feed 4',
      'feedType': 'Type 3',
      'feedQuantity': '150 kg',
      'feedCost': '\$80',
      'reorderLevel': '25 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-06-08',
    },
    {
      'feedName': 'Feed 5',
      'feedType': 'Type 2',
      'feedQuantity': '75 kg',
      'feedCost': '\$40',
      'reorderLevel': '10 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-06-05',
    },
    {
      'feedName': 'Feed 6',
      'feedType': 'Type 1',
      'feedQuantity': '120 kg',
      'feedCost': '\$60',
      'reorderLevel': '15 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-06-02',
    },
    {
      'feedName': 'Feed 7',
      'feedType': 'Type 2',
      'feedQuantity': '80 kg',
      'feedCost': '\$45',
      'reorderLevel': '12 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-05-30',
    },
    {
      'feedName': 'Feed 8',
      'feedType': 'Type 3',
      'feedQuantity': '180 kg',
      'feedCost': '\$90',
      'reorderLevel': '20 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-05-28',
    },
    {
      'feedName': 'Feed 9',
      'feedType': 'Type 1',
      'feedQuantity': '250 kg',
      'feedCost': '\$120',
      'reorderLevel': '30 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-05-25',
    },
    {
      'feedName': 'Feed 10',
      'feedType': 'Type 2',
      'feedQuantity': '100 kg',
      'feedCost': '\$55',
      'reorderLevel': '15 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-05-22',
    },
    {
      'feedName': 'Feed 11',
      'feedType': 'Type 3',
      'feedQuantity': '90 kg',
      'feedCost': '\$50',
      'reorderLevel': '10 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-05-20',
    },
    {
      'feedName': 'Feed 12',
      'feedType': 'Type 1',
      'feedQuantity': '180 kg',
      'feedCost': '\$90',
      'reorderLevel': '20 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-05-18',
    },
    {
      'feedName': 'Feed 13',
      'feedType': 'Type 2',
      'feedQuantity': '70 kg',
      'feedCost': '\$35',
      'reorderLevel': '10 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-05-15',
    },
    {
      'feedName': 'Feed 14',
      'feedType': 'Type 3',
      'feedQuantity': '200 kg',
      'feedCost': '\$100',
      'reorderLevel': '25 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-05-12',
    },
    {
      'feedName': 'Feed 15',
      'feedType': 'Type 1',
      'feedQuantity': '150 kg',
      'feedCost': '\$75',
      'reorderLevel': '20 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-05-10',
    },
    {
      'feedName': 'Feed 16',
      'feedType': 'Type 2',
      'feedQuantity': '60 kg',
      'feedCost': '\$30',
      'reorderLevel': '8 kg',
      'supplier': 'Supplier A',
      'purchaseDate': '2023-05-07',
    },
    {
      'feedName': 'Feed 17',
      'feedType': 'Type 3',
      'feedQuantity': '120 kg',
      'feedCost': '\$60',
      'reorderLevel': '15 kg',
      'supplier': 'Supplier B',
      'purchaseDate': '2023-05-05',
    },
    {
      'feedName': 'Feed 18',
      'feedType': 'Type 1',
      'feedQuantity': '90 kg',
      'feedCost': '\$45',
      'reorderLevel': '12 kg',
      'supplier': 'Supplier C',
      'purchaseDate': '2023-05-02',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inventory Levels"),
          centerTitle: true,
        ),
        body: Padding(
          padding:const EdgeInsets.all(10),
          child: ListView(
            children:[ Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: DataTable(
                columns: const [
                   DataColumn(label: Text('#')),
                  DataColumn(label: Text('Feed Name')),
                  DataColumn(label: Text('Feed Type')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Reorder Level')),
                  DataColumn(label: Text('Supplier')),
                  DataColumn(label: Text('Purchase Date')),
                  DataColumn(label: Text('Action')),
                ],
                rows: feedData.map((data) {
                  return DataRow(cells: [
                    const DataCell(Text("1")),
                    DataCell(Text(data['feedName'])),
                    DataCell(Text(data['feedType'])),
                    DataCell(Text(data['feedQuantity'])),
                    DataCell(Text(data['feedCost'])),
                    DataCell(Text(data['reorderLevel'])),
                    DataCell(Text(data['supplier'])),
                    DataCell(Text(data['purchaseDate'])),
                    DataCell(Row(children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: Colors.green, size: 25,)
                      ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.grey, size: 30,)
                          ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.red, size: 25,)
                      ),
                    ],)),
                  ]);
                }).toList(),
              )),
            ),
            ]
          ),
        ));
  }
}
