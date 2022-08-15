import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCustomizado extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color enableColor;
  final Color shadowColor;
  final bool obscure;
  final bool autofocus;

  InputCustomizado({
    required this.icon,
    required this.hintText,
    required this.fillColor,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.shadowColor = const Color(0xffffff),
    this.enableColor = const Color(0xff1a1919),
    this.obscure = false,
    this.autofocus = false,

  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 5.0,
      shadowColor:shadowColor, // Colors.grey[350]
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        autofocus: autofocus,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 15,
            color: Colors.white
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white
            ),
            prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(this.icon,
                color: Colors.indigoAccent,)
            ),
            filled: true,
            fillColor: fillColor, //CAE0E0
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
            ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1.18,color: Color(0xff1a1919),),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1.2,color: enableColor), //Color(0xff1a1919)
          ),
        ),
        cursorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
