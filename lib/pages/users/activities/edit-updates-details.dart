import 'package:flutter/material.dart';
// ignore: must_be_immutable
class UpdatesAndEidtsLogPage extends StatelessWidget {
   UpdatesAndEidtsLogPage({super.key});
  List items=['Updates',"Edits"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Updates and Edits Logs"),
        centerTitle: true,
        actions: [
          // DropdownButton(items: const[
          //   DropdownMenuItem(child: Text("Updates")),
          //   DropdownMenuItem(child: Text("Edits")),
          //   ], onChanged: (item){})
        ],
      ),
      body:  ListView(
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
                                  text: "Item: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: "User name ",
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
                               const SizedBox(
                            width: 30,
                          ),
                               RichText(
                              text: const TextSpan(
                                  text: "Event: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: "Updated",
                                    style: TextStyle(
                                        fontSize: 18,
                                        
                                        fontWeight: FontWeight.w400)),
                              ])),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}