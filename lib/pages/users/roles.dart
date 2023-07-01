import 'package:flutter/material.dart';
import 'package:fms/services/fms-change-notifier.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RolePage extends StatelessWidget {
  String userId;
  RolePage({super.key, required this.userId});


  @override
  Widget build(BuildContext context) {
    FmsChanageNotifier isChecked=Provider.of<FmsChanageNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Role for $userId"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        children: [
          Container(
            margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isChecked.isCheckedSuperAdmin,
                      onChanged: (value) {
                        isChecked.isCheckedRoledSuperAdmin(value);
                      }),
                  const Text(
                    "Super admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          Container(
             margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isChecked.isCheckedAdmin,
                      onChanged: (value) {
                        isChecked.isCheckedRoleAdmin(value);
                      }),
                  const Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          Container(
             margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isChecked.isCheckedUser,
                      onChanged: (value) {
                        isChecked.isCheckedRoleUser(value);
                      }),
                  const Text(
                    "Normal user",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
