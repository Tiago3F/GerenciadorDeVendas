// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// import '../controllers/form_store.dart';

// class RegisterUserPage extends StatefulWidget {
//   const RegisterUserPage({Key? key}) : super(key: key);

//   @override
//   _RegisterUserPageState createState() => _RegisterUserPageState();
// }

// class _RegisterUserPageState extends State<RegisterUserPage> {
//   final FormStore store = FormStore();

//   @override
//   void initState() {
//     super.initState();
//     store.setupValidations();
//   }

//   @override
//   void dispose() {
//     store.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text("GItens"),
//           backgroundColor: const Color(0xff47afc9),
//         ),
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: MediaQuery.of(context).size.height / 6),
//               child: SizedBox(
//                 width: 320,
//                 child: Form(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       children: [
//                         Observer(
//                           builder: (_) => TextField(
//                             onChanged: (value) => store.email = value,
//                             decoration: InputDecoration(
//                               labelText: 'Email',
//                               hintText: 'Insira seu email',
//                               errorText: store.error.email,
//                               labelStyle: const TextStyle(
//                                   fontSize: 15, color: Color(0xff47afc9)),
//                               errorStyle: const TextStyle(color: Colors.red),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff47afc9)),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Observer(
//                           builder: (_) => TextField(
//                             onChanged: (value) => store.password = value,
//                             decoration: InputDecoration(
//                               labelText: 'Senha',
//                               hintText: 'Insira sua senha',
//                               errorText: store.error.password,
//                               labelStyle: const TextStyle(
//                                   fontSize: 15, color: Color(0xff47afc9)),
//                               errorStyle: const TextStyle(color: Colors.red),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff47afc9)),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             TextButton(
//                               onPressed: () {
//                                 Modular.to.navigate('./registration');
//                               },
//                               style: TextButton.styleFrom(
//                                 primary: Colors.grey,
//                               ),
//                               child: Text(
//                                 'Esqueceu sua senha?',
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 30),
//                         ElevatedButton(
//                           onPressed: store.validateAll,
//                           style: ElevatedButton.styleFrom(
//                             primary: const Color(0xff47afc9),
//                             onPrimary: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                           child: const SizedBox(
//                             width: double.infinity,
//                             height: 50,
//                             child: Center(
//                               child: Text("ENTRAR"),
//                             ),
//                           ),
//                         ),
//                         Row(children: [
//                           Expanded(
//                             child: Divider(
//                               color: Colors.grey[300],
//                               height: 50,
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Text("Continue com"),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               color: Colors.grey[400],
//                               height: 50,
//                             ),
//                           ),
//                         ]),
//                         Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SignInButton(
//                                 Buttons.Google,
//                                 text: "Entrar com o Google",
//                                 onPressed: () {},
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }
