import 'package:flutter/material.dart';
import 'package:fms/auth/register.dart';
import 'package:fms/controller/model/farm_user.dart';
import 'package:fms/pages/home.dart';
import 'package:fms/widgets/text_logreg_field.dart';
import 'package:provider/provider.dart';

import '../controller/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width:size.width, height:size.height*0.3,
                  
                // ),
                const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                 CustomInputField(hintTextLabel: "Enter email",inputController: emailController,validatorMessage: "Email is required"),
                 const SizedBox(height: 10,),
                 CustomInputField(hintTextLabel: "Enter password",inputController: passwordController,validatorMessage: "Password is required", secureText: true,),
                 const SizedBox(height: 15,),
                 ElevatedButton(onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                      await context.read<UserController>().signInUser(FarmUser(email: emailController.text, password: passwordController.text)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))
                      );
                       
                      
                  }
                 }, child:const Text("Login")),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Don't have an count?",style: TextStyle(fontSize: 16),),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      child: const Text("SIGNUP",style: TextStyle(fontSize: 16, color: Colors.purple),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const RegisterPage()));
                      },
                    )
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}