import 'package:animate_do/animate_do.dart';
import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:cadastro_usuario_web/app/widgets/registrationDefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileDesktop extends StatelessWidget {
  final HomeStore _controller = Modular.get();


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
        child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.80,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Material(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Dados Pessoais",
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              children: [
                                Container(
                                  child: RegistrationDefaultTextField(
                                    hintText: "Nome Completo",
                                    length: 50,
                                    textInputType: TextInputType.text,
                                    controller: _controller.updateNameController,
                                    enabled: true,
                                    obscure: false,
                                    validation: (String value) {
                                      if (_controller.validateNameField(value) ==
                                          false) {
                                        return 'Insira o seu Nome e Sobrenome';
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  hintText: "CPF",
                                  length: 11,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _controller.updateCpfController,
                                  validation: (String value) {
                                    if (_controller.validateCPFField(value) ==
                                        false) {
                                      return 'Insira um CPF válido';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                                const SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 11,
                                  hintText: "PIS",
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _controller.updatePisController,
                                  validation: (String value) {
                                    if (_controller.validatePISField(value) ==
                                        false) {
                                      return 'Insira o PIS corretamente';
                                    }
                                  },
                                  enabled: true,
                                  obscure: false,
                                ),
                                const SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 60,
                                  hintText: "E-mail",
                                  textInputType: TextInputType.text,
                                  controller: _controller.updateEmailController,
                                  validation: (String value) {
                                    if (_controller
                                        .validateEmailField(value) ==
                                        false) {
                                      return 'Insira o E-mail corretamente';
                                    }
                                  },
                                  enabled: false,
                                  obscure: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              TextFormField(
                                style: GoogleFonts.nunito(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                                maxLength: 8,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                controller: _controller.updateCepController,
                                decoration: InputDecoration(
                                  counterText: "",
                                  suffix: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.search,
                                        size: 17,
                                      ),
                                      onTap: () {
                                        _controller.retornarInfosCep(_controller.updateCepController.text);

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
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                    borderSide: BorderSide(
                                      width: 1.18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                    borderSide: BorderSide(
                                      width: 1.2,
                                      color: Colors.black,
                                    ), //Color(0xff1a1919)
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                    borderSide: BorderSide(
                                      width: 1.2,
                                      color: Colors.grey,
                                    ), //Color(0xff1a1919)
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              RegistrationDefaultTextField(
                                length: 20,
                                hintText: "Logradouro",
                                textInputType: TextInputType.text,
                                controller: _controller.updateLogradouroController,
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
                              const SizedBox(height: 15),
                              RegistrationDefaultTextField(
                                length: 20,
                                hintText: "Numero",
                                textInputType: TextInputType.text,
                                controller: _controller.updateNumeroController,
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
                              const SizedBox(height: 15),
                              RegistrationDefaultTextField(
                                length: 20,
                                hintText: "Bairro",
                                textInputType: TextInputType.text,
                                controller: _controller.updateBairroController,
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
                              const SizedBox(height: 15),
                              RegistrationDefaultTextField(
                                length: 20,
                                hintText: "Cidade",
                                textInputType: TextInputType.text,
                                controller: _controller.updateCidadeController,
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              children: [
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "Estado",
                                  textInputType: TextInputType.text,
                                  controller: _controller.updateUfController,
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
                                const SizedBox(height: 15),
                                RegistrationDefaultTextField(
                                  length: 20,
                                  hintText: "País",
                                  textInputType: TextInputType.text,
                                  controller: _controller.updatePaisController,
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
                                const SizedBox(height: 200),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _controller.updateNameController.text.isNotEmpty &&
                            _controller.updateCpfController.text.isNotEmpty &&
                            _controller.updatePisController.text.isNotEmpty &&
                            _controller.updateEmailController.text.isNotEmpty &&
                            _controller.updateCepController.text.isNotEmpty &&
                            _controller.updateLogradouroController.text.isNotEmpty &&
                            _controller.updateNumeroController.text.isNotEmpty &&
                            _controller.updateBairroController.text.isNotEmpty &&
                            _controller.updateCidadeController.text.isNotEmpty &&
                            _controller.updateUfController.text.isNotEmpty &&
                            _controller.updatePaisController.text.isNotEmpty
                            ?
                        FadeInDown(
                          delay: Duration(milliseconds: 200),
                          child: TextButton(
                            child: Text(
                              "Editar Dados",
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              // await _controller.CadastrarUser();
                              // if(_controller.resultUsuario==true){
                              //   Modular.to.navigate("/");
                              // }

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
      ),
    );
  }
}
