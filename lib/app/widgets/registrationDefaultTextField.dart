import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationDefaultTextField extends StatelessWidget {
  final String hintText;
  final Function? onTapPassword;
  final TextInputType textInputType;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final Function? validation;
  final bool enabled;
  final bool obscure;
  final int length;

  const RegistrationDefaultTextField(
      {Key? key,
        required this.hintText,
        required this.textInputType,
        required this.controller,
        this.onTapPassword,
        this.textInputFormatter,
        this.validation,
        required this.enabled,
        required this.length,
        required this.obscure,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      maxLength:length,
      enabled: enabled,
      style: GoogleFonts.nunito(
        color: Colors.grey[700],
        fontSize: 17,
      ),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validation!(value),
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        counterText: "",
        hintStyle: TextStyle(color: Colors.black),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        alignLabelWithHint: true,
        contentPadding:EdgeInsets.fromLTRB(20, 18, 20, 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(
            width: 1.18,
            color: Colors.black,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.black,
          ), //Color(0xff1a1919)
        ) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.grey,
          ), //Color(0xff1a1919)
        ),
      ),
    );
  }
}
