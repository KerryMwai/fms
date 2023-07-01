import 'package:flutter/material.dart';
import 'package:fms/pages/inventories/equipment/equipment_inventories_information.dart';
import 'package:fms/pages/inventories/equipment/purchase_equipment.dart';
import 'package:fms/pages/inventories/fertilizer/fertilizer_inventories_information.dart';
import 'package:fms/pages/inventories/fertilizer/purchace_fertilizer.dart';
import 'package:fms/pages/inventories/seed/purchase_information.dart';
import 'package:fms/pages/inventories/seed/purchse_seeds.dart';
import 'package:fms/pages/inventories/seed/seed_inventories_information.dart';

class InventoryManager extends StatefulWidget {
  const InventoryManager({super.key});

  @override
  State<InventoryManager> createState() => _InventoryManagerState();
}

class _InventoryManagerState extends State<InventoryManager> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 7,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          if(index==1){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SeedInventoryInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Seed Inventory")),
                ),
              ),
            );
          }else if(index==2){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PurchaseSeeds())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Purchase Seeds")),
                ),
              ),
            );
          }else if(index==3){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PurchaseFertilizer())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Purchase Fertilizer")),
                ),
              ),
            );
          }else if(index==4){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const FertilizerInventoryInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Fertlizer Inventory")),
                ),
              ),
            );
          }else if(index==5){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PurchaseEquipment())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Purchase Equipment")),
                ),
              ),
            );
          }else if(index==6){
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EquipmentInventoryInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Equipment information")),
                ),
              ),
            );
          }else{
             return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SeedPurchaseInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Seed purchase information")),
                ),
              ),
            );
          }
           
        });
  }
}
// CropsAlertNotificationTable