import 'package:flutter/material.dart';
import 'package:install_check/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   child: Center(
    //     child: Text(
    //       "Login Page",
    //       style: TextStyle(
    //         fontSize: 30,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.amber,
    //       ),
    //       // textScaleFactor: 2.0,
    //     ),
    //   ),
    // );
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("resources/images/login_image.png",
              fit: BoxFit.cover, height: 150, width: 150),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "WELCOME",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter User Name", labelText: "UserName"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // print("hello");
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: const Text("Login"),
                  style: TextButton.styleFrom(
                      elevation: 4.0,
                      backgroundColor: Colors.cyan,
                      // shadowColor: Colors.green
                      minimumSize: Size(100, 40)),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
