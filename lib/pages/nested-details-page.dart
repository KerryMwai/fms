// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop_manager.dart';
import 'package:fms/pages/crop_managemnt/harvesting_management.dart';
import 'package:fms/pages/inventories/inventories_manager.dart';
import 'package:fms/pages/livestock/breeding/breed_management.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management.dart';
import 'package:fms/pages/livestock/feed-record/feed-management.dart';
import 'package:fms/pages/livestock/feed-record/feed-reporting.dart';
import 'package:fms/pages/livestock/health-management/add_animal_health_information.dart';
import 'package:fms/pages/livestock/health-management/health_monotoring.dart';
import 'package:fms/pages/users/activity-logs.dart';
import 'package:fms/pages/users/permission-management.dart';
import 'package:fms/pages/users/role-management.dart';
import 'package:fms/pages/users/user-creation.dart';
import 'package:fms/pages/users/users-details.dart';
import 'package:fms/pages/users/users-list-page.dart';
import 'package:fms/widgets/custom_drawer.dart';


// ignore: must_be_immutable
class SubDetailsPage extends StatefulWidget {
  String id;
  String name;
  List subsections;
  SubDetailsPage({super.key, this.id='', required this.name,  this.subsections=const []});

  @override
  State<SubDetailsPage> createState() => _SubDetailsPageState();
}

class _SubDetailsPageState extends State<SubDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(widget.name),
        centerTitle: true,
        actions: const [],
      ),
      drawer:const CustomDrawer(),
      body: sectionToRoute(widget.name),
      floatingActionButton: FloatingActionButton(onPressed: (){
        switch(widget.name.trim()){
          case "Health Management":
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddAnimalHealthInformation()));
          });
          break;
          default:
            print("No section set now");
        }
      },child: const Icon(Icons.add),),
    );
  }

  sectionToRoute(String nameofpage){
    if((nameofpage.trim()=="Feed Records")){
        return const FeedManagementPage();
    }else if(nameofpage.trim()=="Livestock Management"){
      return const LivestockFeedManagement();
    }else if(nameofpage.trim()=="Reporting"){
      return const FeedReportingPage();
    }else if(nameofpage.trim()=="Health Management"){
      return const LivestockHealthMonotoring();
    }else if(nameofpage.trim()=="Breeding"){
      return const  BreedManagement();
    }else if(nameofpage.trim()=="Planning"){
      return const CropManager();
    }else if(nameofpage.trim()=="Harvesting"){
      return const  HarvestingManager();
    }else if(nameofpage.trim()=="All inventories"){
        return const InventoryManager();
    }
  }

  userpageToDisplay(String pagename) {
    print(pagename.runtimeType);
    if (pagename == "Users") {
      return const Users();
    } else if (pagename == "User Details") {
      return const UsersDetails();
    } else if (pagename == "Role management") {
      return const RolesPage();
    } else if (pagename == "Permission Management") {
      return const PermissionPage();
    } else if (pagename == "User creation") {
      return UserCreation();
    } else if (pagename == "Activity Logs") {
      return const ActivityLogPage();
    } else {
      return  const  Text("data");
    }
  }
}



