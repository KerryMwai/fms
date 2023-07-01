import 'package:flutter/material.dart';
import 'package:fms/pages/users/roles.dart';

class RolesPage extends StatelessWidget {
  const RolesPage({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return ListView(
      children: List.generate(20, (index) {
        if (index == 0) {
          return Card(
            color: Colors.grey,
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10),
                  width: size.width * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Filter information...",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child:const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 18,
                      ),
                      Icon(
                        Icons.arrow_downward,
                        size: 18,
                      ),
                    ],
                  )),
                )
              ],
            ),
          );
        } else {
          index -= 1;
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  RolePage(userId: "12345")));
            },
            child: Card(
              color: Colors.grey,
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          decoration: const BoxDecoration(
                              color: Colors.deepOrange, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("User Test"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("user@gmail.com"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("Role:Senior Officer"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("DOB: 09/23/1978"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Citizenship: Kenya"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Residence: Nairobi"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Phone: +25471234568"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Address:2500-30100"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("City: Eldoret"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
