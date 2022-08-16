import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:cadastro_usuario_web/app/widgets/registrationDefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationDesktop extends StatelessWidget {
  final RegistrationStore _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.deepPurpleAccent,//Color(0xff1F1F30)
        ),
        child: Expanded(
            flex: 1,
            child: Observer(
                builder: (_) => Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                            "Cadastro",
                            style: GoogleFonts.openSans(
                                color: const Color(0xff1F1F30),
                                fontSize: 35.0,
                                fontWeight: FontWeight.w800),
                          ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                children: [
                                  RegistrationDefaultTextField(
                                      hintText: "Nome Completo",
                                      length: 50,
                                      textInputType: TextInputType.text,
                                      controller: _controller.nameController,
                                      enabled: true,
                                  validation: (String value) {
                                    if (_controller.validateNameField(value) ==
                                        false) {
                                      return 'Insira o seu Nome e Sobrenome';
                                    }
                                  },
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    hintText: "CPF",
                                    length: 11,
                                    textInputType: TextInputType.number,
                                    textInputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: _controller.cpfController,
                                    validation: (String value) {
                                      if (_controller.validateCPFField(value)==
                                          false) {
                                        return 'Insira um CPF válido';
                                      }
                                    }, enabled: true,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 11,
                                    hintText: "PIS",
                                    textInputType: TextInputType.number,
                                    textInputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: _controller.pisController,
                                    validation: (String value) {
                                      if (_controller.validatePISField(value) ==
                                          false) {
                                        return 'Insira o PIS corretamente';
                                      }
                                    }, enabled: true,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length:60,
                                    hintText: "E-mail",
                                    textInputType: TextInputType.text,
                                    controller: _controller.emailController,
                                    validation: (String value) {
                                      if (_controller.validateEmailField(value) ==
                                          false) {
                                        return 'Insira o E-mail corretamente';
                                      }
                                    }, enabled: true,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "Senha",
                                    textInputType: TextInputType.text,
                                    controller: _controller.passwordController,
                                    validation: (String value) {
                                      if (_controller.validatePassWordField(value) ==
                                          false) {
                                        return 'Insira a Senha corretamente';
                                      }
                                    }, enabled: true,
                                  ),
                                ],

                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                TextFormField(
                                  style: GoogleFonts.nunito(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                  ),
                                  maxLength: 8,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,
                                  controller: _controller.cepController,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    suffix: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        child: Icon(Icons.search,
                                          size: 17,
                                        ),
                                        onTap: () {

                                        },
                                      ),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black),
                                    hintText: "CEP",
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
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Logradouro",
                                  textInputType: TextInputType.text,
                                  controller: _controller.passwordController,
                                  validation: (String value) {
                                    if (_controller.validatePassWordField(value) ==
                                        false) {
                                      return 'Insira a Senha corretamente';
                                    }
                                  }, enabled: true,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Numero",
                                  textInputType: TextInputType.text,
                                  controller: _controller.passwordController,
                                  validation: (String value) {
                                    if (_controller.validatePassWordField(value) ==
                                        false) {
                                      return 'Insira a Senha corretamente';
                                    }
                                  }, enabled: true,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Bairro",
                                  textInputType: TextInputType.text,
                                  controller: _controller.passwordController,
                                  validation: (String value) {
                                    if (_controller.validatePassWordField(value) ==
                                        false) {
                                      return 'Insira a Senha corretamente';
                                    }
                                  }, enabled: true,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Cidade",
                                  textInputType: TextInputType.text,
                                  controller: _controller.passwordController,
                                  validation: (String value) {
                                    if (_controller.validatePassWordField(value) ==
                                        false) {
                                      return 'Insira a Senha corretamente';
                                    }
                                  }, enabled: true,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                verticalDirection: VerticalDirection.up,
                                children: [
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "Estado",
                                    textInputType: TextInputType.text,
                                    controller: _controller.passwordController,
                                    validation: (String value) {
                                      if (_controller.validatePassWordField(value) ==
                                          false) {
                                        return 'Insira a Senha corretamente';
                                      }
                                    }, enabled: true,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "Pais",
                                    textInputType: TextInputType.text,
                                    controller: _controller.passwordController,
                                    validation: (String value) {
                                      if (_controller.validatePassWordField(value) ==
                                          false) {
                                        return 'Insira a Senha corretamente';
                                      }
                                    }, enabled: true,
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                )
            )
        ),
      ),

    );
  }
}
