import 'package:flutter/material.dart';
import 'package:fms/auth/login.dart';
import 'package:fms/controller/model/farm_user.dart';
import 'package:fms/controller/user_controller.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/home.dart';
import 'package:fms/widgets/text_logreg_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   const SizedBox(
                  height: 20,
                ),
                  Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("asset/images/field.jpg"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30,
                ),
                 CustomInputField(hintTextLabel: "Enter email",inputController: emailController,validatorMessage: "Email is required"),
                 const SizedBox(height: 10,),
                 CustomInputField(hintTextLabel: "Enter password",inputController: passwordController,validatorMessage: "Password is required", secureText: true,),
                 const SizedBox(height: 10,),
                 CustomInputField(hintTextLabel: "Enter confirm password",inputController: confirmpasswordController,validatorMessage: "Confirm password is required", comparison: true, pass1: passwordController.text, pass2: confirmpasswordController
                 .text, secureText: true,),
                 const SizedBox(height: 15,),
                 SizedBox(
                  width: size.width*0.5,
                  height: 40,
                   child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(green)
                    ),
                    onPressed: ()async{
                    if(_formKey.currentState!.validate()){
                       await context.read<UserController>().signUpUser(FarmUser(email: emailController.text, password: passwordController.text)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
                    }
                   }, child:const Text("Register", style: TextStyle(fontSize: 18),)),
                 ),
                     const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Have an count?",style: TextStyle(fontSize: 16),),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      child: const Text("SIGNIN",style: TextStyle(fontSize: 16, color: Colors.purple),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
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