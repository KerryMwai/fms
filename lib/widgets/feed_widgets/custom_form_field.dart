import 'package:flutter/material.dart';

class FeedFormField extends StatefulWidget {
  const FeedFormField({super.key,required this.controller, required this.labelText, required this.valitationText});
  final TextEditingController controller;
  final String labelText;
  final String valitationText;

  @override
  State<FeedFormField> createState() => _FeedFormFieldState();
}

class _FeedFormFieldState extends State<FeedFormField> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller:widget.controller,
            decoration:  InputDecoration(
              border:const  OutlineInputBorder(),
              labelText: widget.labelText
            ),
            validator: (val){
              if(val!.isEmpty){
                return widget.valitationText;
              }
              return null;
            },
          ),
        );
  }
}





class FeedFormField2 extends StatefulWidget {
  const FeedFormField2({super.key,required this.controller, required this.labelText, required this.valitationText});
  final TextEditingController controller;
  final String labelText;
  final String valitationText;

  @override
  State<FeedFormField2> createState() => _FeedFormField2State();
}

class _FeedFormField2State extends State<FeedFormField2> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller:widget.controller,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              border:const  OutlineInputBorder(),
              labelText: widget.labelText
            ),
            validator: (val){
              if(val!.isEmpty){
                return widget.valitationText;
              }
              return null;
            },
          ),
        );
  }
}



class FeedFormField3 extends StatefulWidget {
  const FeedFormField3({super.key,required this.controller, required this.labelText, required this.valitationText});
  final TextEditingController controller;
  final String labelText;
  final String valitationText;

  @override
  State<FeedFormField3> createState() => _FeedFormField3State();
}

class _FeedFormField3State extends State<FeedFormField3> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller:widget.controller,
            keyboardType: TextInputType.datetime,
            decoration:  InputDecoration(
              border:const  OutlineInputBorder(),
              labelText: widget.labelText
            ),
            validator: (val){
              if(val!.isEmpty){
                return widget.valitationText;
              }
              return null;
            },
          ),
        );
  }
}

class FeedFormField4 extends StatefulWidget {
  const FeedFormField4({super.key,required this.controller, required this.labelText, required this.valitationText});
  final TextEditingController controller;
  final String labelText;
  final String valitationText;

  @override
  State<FeedFormField4> createState() => _FeedFormField4State();
}

class _FeedFormField4State extends State<FeedFormField4> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller:widget.controller,
            keyboardType: TextInputType.emailAddress,
            decoration:  InputDecoration(
              border:const  OutlineInputBorder(),
              labelText: widget.labelText
            ),
            validator: (val){
              if(val!.isEmpty){
                return widget.valitationText;
              }
              return null;
            },
          ),
        );
  }
}