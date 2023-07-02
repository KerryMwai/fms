import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/farm.dart';
import 'package:fms/controller/user_controller.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/details-page.dart';
import 'package:fms/widgets/custom_drawer.dart';
import 'package:fms/widgets/text_logreg_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Farm"),
        backgroundColor: blueGrey,
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        height: size.height,
        margin: const EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
            stream: context.read<UserController>().getalldepartments(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 60),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final department = snapshot.data!.docs[index];

                    if(department['name'].trim()=="Crops management"){
                      return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPAge(
                                      id: department.id,
                                      name: department['name'],
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/field.jpg"), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            department['name'],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
                    }else if(department['name'].trim()=="Livestock"){
                      return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPAge(
                                      id: department.id,
                                      name: department['name'],
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/dairy.jpg"), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            department['name'],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
                    }else{
                        return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPAge(
                                      id: department.id,
                                      name: department['name'],
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/users.png"), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            department['name'],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
                    }
                  });
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await _showFormDialog(context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  Future<void> _showFormDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Department'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CustomInputField(
                      inputController: nameController,
                      hintTextLabel: "Enter name",
                      validatorMessage: "Department name is required"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInputField(
                      inputController: descriptionController,
                      hintTextLabel: "Enter description",
                      validatorMessage: "Department desription is required"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  await context
                      .read<UserController>()
                      .createFarmDepartment(Farm(
                          name: nameController.text,
                          description: descriptionController.text))
                      .then((value) => Navigator.of(context).pop())
                      .then((value) {
                    nameController.clear();
                    descriptionController.clear();
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}



















// ListView(
//                   children: snapshot.data!.docs.map((DocumentSnapshot document){
//                       Map<String, dynamic> data=document.data()! as Map<String, dynamic>;
//                       return  ListTile(
//                         title: Text(data['section_name']),
//                         subtitle: Text(data['section_description']),
//                       );
//                   }).toList(),
//                 );