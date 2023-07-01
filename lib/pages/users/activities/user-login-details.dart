import 'package:flutter/material.dart';

class LoginLogPage extends StatelessWidget {
  const LoginLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text("Login logs"),
      ),
      body: ListView(
        children: List.generate(
            15,
            (index) => Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text("Name: User Test", style: TextStyle(color: Colors.white, fontSize: 18,),),
                          // SizedBox(width: 15,),
                          // Text("Date: 23/09/2022 4:35 pm",style: TextStyle(color: Colors.white, fontSize: 18,),),
                          RichText(
                              text: const TextSpan(
                                  text: "Name: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: "Test ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "User",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400)),
                              ])),
                          const SizedBox(
                            width: 30,
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: "Date: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: "23/09/2022 ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "4:35 pm",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ])),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
