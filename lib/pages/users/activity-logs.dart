import 'package:flutter/material.dart';
import 'package:fms/pages/users/activities/edit-updates-details.dart';
import 'package:fms/pages/users/activities/user-login-details.dart';

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
   return GridView.count(crossAxisCount: 2, childAspectRatio: 3/2, children: [
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginLogPage()));
      },
      child: Container(
        margin:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(child: Text("Logins", style: TextStyle(color: Colors.white),),),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatesAndEidtsLogPage()));
      },
      child: Container(
        margin:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(child: Text("Edits and Updates", style: TextStyle(color: Colors.white),),),
      ),
    )
   ],);
  }
}