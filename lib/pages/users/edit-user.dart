import 'package:flutter/material.dart';
import 'package:fms/widgets/custom-widgets.dart';

// ignore: must_be_immutable
class UserEdit extends StatelessWidget {
  String userId;
  UserEdit({super.key, required this.userId});
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userDOB = TextEditingController();
  TextEditingController userCitizenship = TextEditingController();
  TextEditingController userdepartment = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userResidence = TextEditingController();
  TextEditingController userHomeAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Edit $userId"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: firstName,
                    hintText: "First name",
                    isObsecure: false,
                    prefixicon: Icons.person)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: secondName,
                    hintText: "Second name",
                    isObsecure: false,
                    prefixicon: Icons.person)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: userDOB,
                    hintText: "Date of birth",
                    isObsecure: false,
                    prefixicon: Icons.calendar_month)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: useremail,
                    hintText: "User email",
                    isObsecure: false,
                    prefixicon: Icons.email)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: phoneNumber,
                    hintText: "User phone",
                    isObsecure: false,
                    prefixicon: Icons.phone)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: userResidence,
                    hintText: "User residence",
                    isObsecure: false,
                    prefixicon: Icons.location_city)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: userHomeAddress,
                    hintText: "Home Address",
                    isObsecure: false,
                    prefixicon: Icons.mail)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: userCitizenship,
                    hintText: "Citizenship",
                    isObsecure: false,
                    prefixicon: Icons.map)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: CustomTextField(
                    textEditingController: userdepartment,
                    hintText: "Department",
                    isObsecure: false,
                    prefixicon: Icons.subtitles)),
                    Container(
                      margin:const  EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: (){}, child:const Text("Update"))
                        ],
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
