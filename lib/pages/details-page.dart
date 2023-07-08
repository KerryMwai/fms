import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/farm.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/nested-details-page.dart';
import 'package:fms/widgets/custom_drawer.dart';
import 'package:fms/widgets/text_logreg_field.dart';
import 'package:provider/provider.dart';

import '../controller/user_controller.dart';
// import 'package:fms/dammies/test-data.dart';

class DetailsPAge extends StatelessWidget {
  final String id;
  final String name;
  final List subsections;
  DetailsPAge(
      {super.key,
      this.id = '',
      required this.name,
      this.subsections = const []});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: green,
      ),
      drawer:const CustomDrawer(),
      body: StreamBuilder<QuerySnapshot>(
          stream: context.read<UserController>().getAllSubDepartments(id, name),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("An eeror occured while accessing the server"),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2/2.6 
                      // childAspectRatio: 3 / 2
                      ),
                  itemBuilder: (context, index) {
                    final subdepartment = snapshot.data!.docs[index];
            // Harvesting
                    if(subdepartment['name'].trim()=="Harvesting"){
                      return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(

                                  image:const  DecorationImage(
                                      image: AssetImage("asset/images/harvesting.jpg"), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }
            // Planning
                    if(subdepartment['name'].trim()=="Planning"){
                         return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                     
                                  image:const  DecorationImage(
                                      image: AssetImage("asset/images/planning.jpg"),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Feed Records"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                      
                                  image:const  DecorationImage(
                                      image: AssetImage("asset/images/record.jpg"),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Reporting"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                  image:const  DecorationImage(
                                      image: AssetImage("asset/images/report.jpg"),fit: BoxFit.cover),
                                ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Health Management"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage("asset/images/laborm.jpg"),fit: BoxFit.cover),
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Breeding"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage("asset/images/breed.jpg"),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Reporting"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage("asset/images/report.jpg"),fit: BoxFit.cover),
                                 ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }else if(subdepartment['name'].trim()=="Livestock Management"){
                       return GestureDetector(
                        onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: size.width * 0.33,
                              decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                  image:const  DecorationImage(
                                      image: AssetImage("asset/images/dairy.jpg"), fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subdepartment['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: green),
                            )
                          ],
                        ),
                      );
                    }





                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDetailsPage(
                                    name: subdepartment['name'],)));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.17,
                                    child: Text(
                                      subdepartment['name'],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 5),
                                  width: MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.width * 0.12,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 212, 86, 2),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(Icons.subtitles),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.5),
                              thickness: 2,
                              height: 0,
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.withOpacity(0.7),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)))))
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
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
          title: Text('Add department in $name'),
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
              onPressed: ()  {
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
                  await context.read<UserController>().createFarmSubDepartment(
                      Farm(
                          name: nameController.text,
                          description: descriptionController.text),
                      id,
                      name).then((value) => Navigator.of(context).pop());
                  nameController.clear();
                  descriptionController.clear();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
