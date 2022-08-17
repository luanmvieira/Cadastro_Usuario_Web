import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeDesktop extends StatefulWidget {



  @override
  _HomeDesktopState createState() => _HomeDesktopState();

}


class _HomeDesktopState extends ModularState<HomeDesktop, HomeStore> {
  @override
  void initState() {
    controller.getCurrentUser();
    controller.checkUserLoggedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>  controller.getValidator
          ? Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text('Olá ${controller.nameCurrentUser} !',
            style: GoogleFonts.openSans(
                color: const Color(0xFF000000),
                fontSize: 25.0,
                fontWeight: FontWeight.w500)
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.edit,
                    size: 20,
                    color: Color(0xFF000000),
                  ),
                  onTap: (){
                    Modular.to.navigate("/home/profile");

                  },
                ),
                SizedBox(width: 15),
                GestureDetector(
                  child: Icon(Icons.logout,
                    size: 20,
                    color: Color(0xFF000000),
                  ),
                  onTap: () async {
                    await controller.logOut();

                  },
                ),
                SizedBox(width: 15),
              ],
            ),
          ],
        ),
        backgroundColor: Color(0xff1F1F30),
      ) : Scaffold(
          backgroundColor: Color(0xff1F1F30),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Center(child: SpinKitWave(color: Colors.white, size: 45,))
              ],
            ),
          )
      ),
    );

  }
}