import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.inputController, required this.hintTextLabel, required this.validatorMessage, this.comparison=false, this.pass1='', this.pass2='', this.secureText=false});

  final TextEditingController inputController;
  final String hintTextLabel;
  final String validatorMessage;
  final String pass1;
  final String pass2;
  final bool comparison;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            obscureText: secureText,
            controller: inputController,
            validator: (value){
              if(value!.isEmpty){
                return validatorMessage;
              }

              if(comparison){
                if(pass2!=pass1){
                  return "Password do not match";
                }
              }
              return null;
            },
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintTextLabel,
            ),
          ),
        );
  }
}