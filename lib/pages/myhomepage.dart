import 'package:flutter/material.dart';
import 'package:fms/services/firebase-manager.dart';
import 'package:fms/services/fms-change-notifier.dart';
import 'package:fms/widgets/custom-widgets.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    FmsChanageNotifier fmsChanageNotifier = Provider.of<FmsChanageNotifier>(context);
    FirebaseManager firebaseManager = Provider.of<FirebaseManager>(context);
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: size.width * 0.15, horizontal: size.width * 0.07),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: fmsChanageNotifier.accountdecision
                ?

                 SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: size.width * 0.4,
                            height: size.width * 0.4,
                            decoration: const BoxDecoration(
                                // color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1625246333195-78d9c38ad449?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YWdyaWN1bHR1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5,
                            ),
                            child: Column(
                              children: [
                                firebaseManager.emailexist!=""?Text(firebaseManager.emailexist,style: const TextStyle(color: Colors.red),):const Text(""),
                                firebaseManager.passworddonotmatch!=""?Text(firebaseManager.passworddonotmatch, style: const TextStyle(color: Colors.red),):const Text(""),
                              ],
                            )
                            ),
                          CustomTextField(
                            textEditingController: username,
                            hintText: "Enter username",
                            isObsecure: false,
                            prefixicon: Icons.person,
                          ),
                          CustomTextField(
                            textEditingController: useremail,
                            hintText: "Enter email",
                            isObsecure: false,
                            prefixicon: Icons.email,
                          ),
                          CustomTextField(
                            textEditingController: userpassword,
                            hintText: "Enter password",
                            isObsecure: true,
                            prefixicon: Icons.security,
                          ),
                          CustomTextField(
                            textEditingController: confirm_password,
                            hintText: "Confirm password",
                            isObsecure: true,
                            prefixicon: Icons.security,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text("Have an account?"),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          if (fmsChanageNotifier.accountdecision) {
                                            fmsChanageNotifier.dontHaveAccount();
                                          } else {
                                            fmsChanageNotifier.hasaccount();
                                          }
                                          print(fmsChanageNotifier.accountdecision);
                                        },
                                        child: const Text(
                                          "Signin",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      firebaseManager.testForPasswordMatch(userpassword.text, confirm_password.text);
                                      firebaseManager.signupuser(useremail.text,
                                          userpassword.text,confirm_password.text ,context);
                                    },
                                    child: const Text("Signup"))
                              ],
                            ),
                          )
                        ]),
                  )
                 
                :
                SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                                // color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1620200423727-8127f75d7f53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFncmljdWx0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                                    fit: BoxFit.fill)),
                          ),
                          CustomTextField(
                            textEditingController: useremail,
                            hintText: "Enter email",
                            isObsecure: false,
                            prefixicon: Icons.email,
                          ),
                          CustomTextField(
                            textEditingController: userpassword,
                            hintText: "Enter password",
                            isObsecure: true,
                            prefixicon: Icons.security,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text("No account?"),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          if (fmsChanageNotifier.accountdecision) {
                                            fmsChanageNotifier.dontHaveAccount();
                                          } else {
                                            fmsChanageNotifier.hasaccount();
                                          }
                                          
                                        },
                                        child: const Text(
                                          "Signup",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      firebaseManager.signinuser(useremail.text,
                                          userpassword.text, context);
                                    },
                                    child: const Text("Signin"))
                              ],
                            ),
                          )
                        ]),
                  )
          )),
    );
  }
}
