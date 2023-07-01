import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("User details"),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        drawer:const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(6, (index) => Column(
              children: [
                  const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Profile"),
                  )),
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Basic Info"),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: (size.width - 10) * 0.5,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 3, left: 3),
                    color: Colors.grey.withOpacity(0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CircleAvatar(radius: 20),
                        Text("Name:Test User"),
                        Text("Email: testuser@gmail.com"),
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 14) * 0.5,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                    color: Colors.grey.withOpacity(0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Citizen:Kenyan"),
                        Text("Resdence: Nairobi"),
                        Text("Role: Manager"),
                        Text("Phone: +254796142416"),
                        Text("Department: Livestock"),
                      ],
                    ),
                  ),
                ],
              )
              ],
            ))
          ),
        ));
  }
}
