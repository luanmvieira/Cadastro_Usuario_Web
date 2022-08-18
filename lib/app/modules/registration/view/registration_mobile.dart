import 'package:animate_do/animate_do.dart';
import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:cadastro_usuario_web/app/widgets/registrationDefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationMobile extends StatelessWidget {
  final RegistrationStore _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.deepPurpleAccent, //Color(0xff1F1F30)
        ),
        child: Observer(
            builder: (_) => Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: SingleChildScrollView(
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
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                children: [
                                  RegistrationDefaultTextField(
                                    hintText: "Nome Completo",
                                    length: 50,
                                    textInputType: TextInputType.text,
                                    controller: _controller.nameController,
                                    enabled: true,
                                    obscure: false,
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
                                      if (_controller.validateCPFField(value) ==
                                          false) {
                                        return 'Insira um CPF válido';
                                      }
                                    },
                                    enabled: true,
                                    obscure: false,
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
                                    },
                                    enabled: true,
                                    obscure: false,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 60,
                                    hintText: "E-mail",
                                    textInputType: TextInputType.text,
                                    controller: _controller.emailController,
                                    validation: (String value) {
                                      if (_controller
                                              .validateEmailField(value) ==
                                          false) {
                                        return 'Insira o E-mail corretamente';
                                      }
                                    },
                                    enabled: true,
                                    obscure: false,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "Senha",
                                    textInputType: TextInputType.text,
                                    controller: _controller.passwordController,
                                    validation: (String value) {
                                      if (_controller
                                              .validatePassWordField(value) ==
                                          false) {
                                        return 'Insira mais de 8 caracteres';
                                      }
                                    },
                                    enabled: true,
                                    obscure: true,
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
                                        child: Icon(
                                          Icons.search,
                                          size: 17,
                                        ),
                                        onTap: () {
                                          _controller.retornarInfosCep(_controller.cepController.text);

                                        },
                                      ),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black),
                                    hintText: "CEP",
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.6),
                                    alignLabelWithHint: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 18, 20, 18),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                      borderSide: BorderSide(
                                        width: 1.18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                      borderSide: BorderSide(
                                        width: 1.2,
                                        color: Colors.black,
                                      ), //Color(0xff1a1919)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
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
                                  controller: _controller.logradouroController,
                                  validation: (String value) {
                                    if (_controller
                                            .validateLogradouroField(value) ==
                                        false) {
                                      return 'Insira o Logradouro corretamente';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Numero",
                                  textInputType: TextInputType.text,
                                  controller: _controller.numeroController,
                                  validation: (String value) {
                                    if (_controller
                                            .validateNumeroField(value) ==
                                        false) {
                                      return 'Insira o Numero corretamente';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Bairro",
                                  textInputType: TextInputType.text,
                                  controller: _controller.bairroController,
                                  validation: (String value) {
                                    if (_controller
                                            .validateLogradouroField(value) ==
                                        false) {
                                      return 'Insira o Bairro corretamente';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                                SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Cidade",
                                  textInputType: TextInputType.text,
                                  controller: _controller.cidadeController,
                                  validation: (String value) {
                                    if (_controller
                                            .validatePassWordField(value) ==
                                        false) {
                                      return 'Insira a Cidade corretamente';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                children: [
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "Estado",
                                    textInputType: TextInputType.text,
                                    controller: _controller.ufController,
                                    validation: (String value) {
                                      if (_controller
                                              .validateUfField(value) ==
                                          false) {
                                        return 'Insira o Estado corretamente';
                                      }
                                    },
                                    enabled: true,
                                    obscure: false,
                                  ),
                                  SizedBox(height: 15),
                                  RegistrationDefaultTextField(
                                    length: 20,
                                    hintText: "País",
                                    textInputType: TextInputType.text,
                                    controller: _controller.paisController,
                                    validation: (String value) {
                                      if (_controller
                                              .validateLogradouroField(value) ==
                                          false) {
                                        return 'Insira o país corretamente';
                                      }
                                    },
                                    enabled: true,
                                    obscure: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                           Column(
                              children: [
                                _controller.nameController.text.isNotEmpty &&
                                    _controller.cpfController.text.isNotEmpty &&
                                    _controller.pisController.text.isNotEmpty &&
                                    _controller.emailController.text.isNotEmpty &&
                                    _controller.passwordController.text.isNotEmpty &&
                                    _controller.cepController.text.isNotEmpty &&
                                    _controller.logradouroController.text.isNotEmpty &&
                                    _controller.numeroController.text.isNotEmpty &&
                                    _controller.bairroController.text.isNotEmpty &&
                                    _controller.cidadeController.text.isNotEmpty &&
                                    _controller.ufController.text.isNotEmpty &&
                                    _controller.paisController.text.isNotEmpty
                                    ? FadeInDown(
                                        delay: Duration(milliseconds: 200),
                                        child: TextButton(
                                          child: Text(
                                            "Concluir cadastro",
                                            style: GoogleFonts.nunito(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          ),
                                          onPressed: () async {
                                            await _controller.CadastrarUser();
                                            if(_controller.resultUsuario==true){
                                              Modular.to.navigate("/");
                                            }

                                          },
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),

                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
