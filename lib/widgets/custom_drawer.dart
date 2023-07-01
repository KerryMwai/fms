import 'package:flutter/material.dart';
import 'package:fms/auth/login.dart';
import 'package:fms/controller/user_controller.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/home.dart';
import 'package:fms/widgets/custom_tile_item.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width*0.6,
        child: ListView(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                maxRadius: 15,
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/04/18/11/03/profile-728591_640.jpg"),
              )),
              Divider(color: grey,),
              CustomTileItem(onPressed: (){
                Navigator.pop(context);
              },iconData: Icons.person, itemTitle: "Profile",),
              
               CustomTileItem(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                Navigator.pop(context);
              },iconData: Icons.home, itemTitle: "Home",),
              
              CustomTileItem(onPressed: (){
                Navigator.pop(context);
              },iconData: Icons.settings, itemTitle: "Settings",),
              
              CustomTileItem(onPressed: (){
                context.read<UserController>().signOutUser().then((value) => Navigator.push(context,MaterialPageRoute(builder: (_)=>const LoginPage())));
                Navigator.pop(context);
              },iconData: Icons.logout, itemTitle: "Logout",),
          ],
        ),
      );
  }
}