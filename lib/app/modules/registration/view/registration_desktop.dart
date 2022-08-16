import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:cadastro_usuario_web/app/widgets/registrationDefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationDesktop extends StatelessWidget {
  final RegistrationStore _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.deepPurpleAccent,//Color(0xff1F1F30)
        ),
        child: Expanded(
            flex: 1,
            child: Observer(
                builder: (_) => Container(
                  height: MediaQuery.of(context).size.height * 0.80,
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
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                RegistrationDefaultTextField(
                                    hintText: "Nome Completo",
                                    textInputType: TextInputType.text,
                                    controller: _controller.nameController,
                                    enabled: true,
                                validation: (String value) {
                                  if (_controller.validateNameField(value) ==
                                      false) {
                                    return 'Insira o seu Nome e Sobrenome';
                                  }
                                },
                                )
                              ],

                            ),
                            Column(

                            ),
                          ],
                        ),
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
