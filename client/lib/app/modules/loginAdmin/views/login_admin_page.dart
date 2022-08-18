import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'widgets/info_system.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginAdminPageData();
  }
}

class LoginAdminPageData extends State<LoginAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GItens"),
        backgroundColor: const Color(0xff47afc9),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 0, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const InfoSystem(),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 57,
                        child: ElevatedButton(
                          onPressed: () {
                            Modular.to.navigate('/registeradmin/perfil');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff47afc9),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const SizedBox(
                            child: Center(
                              child: Text(
                                "ENTRAR",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
