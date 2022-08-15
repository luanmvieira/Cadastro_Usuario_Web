import 'package:cadastro_usuario_web/app/widgets/custom_animated_button.dart';
import 'package:cadastro_usuario_web/app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLogin extends StatelessWidget {
  final double paddingHorizontal;
  final bool carregando;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final Function setEmail;
  final Function setSenha;

  const CustomLogin(
      {Key? key,
      this.paddingHorizontal = 100.0,
      required this.carregando,
      required this.emailController,
      required this.senhaController,
      required this.setEmail,
      required this.setSenha,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return carregando
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Center(
                    child: SpinKitWave(
                  color: Color(0xff1F1F30),
                  size: 45,
                ))
              ],
            ),
          )
        : NotificationListener<OverscrollIndicatorNotification>(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Olá Visitante ",
                      style: GoogleFonts.openSans(
                          color: const Color(0xff1F1F30),
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                      child: Column(
                        children: [
                          InputCustomizado(
                            icon: Icons.mail,
                            hintText: "E-mail, CPF ou PIS",
                            fillColor: const Color(0xff1F1F31),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),
                          InputCustomizado(
                            icon: Icons.lock,
                            hintText: "Senha",
                            fillColor: const Color(0xff1F1F30),
                            controller: senhaController,
                            obscure: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 30),
                          CustomAnimatedButton(
                            onTap: () {
                            },
                            widhtMultiply: 1,
                            height: 50,
                            color: Colors.deepPurpleAccent,
                            text: "Entrar",
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: const Text(
                                "Cadastre-se",
                                style: TextStyle(color: Color(0xff1F1F31),
                                  fontSize: 15,

                                ),
                              ),
                              onTap: () {
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
