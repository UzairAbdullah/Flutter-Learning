import 'package:flutter/material.dart';
import 'package:install_check/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

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
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("resources/images/login_image.png",
                fit: BoxFit.cover, height: 150, width: 150),
            const SizedBox(
              height: 20,
            ),
            Text(
              "WELCOME $name",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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

                  InkWell(
                    onTap: () async {
                      setState(() {
                        changedButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changedButton ? 50 : 140,
                      height: 50,
                      alignment: Alignment.center,
                      child: changedButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // fontSize: 16
                              ),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          // shape: changedButton
                          //     ? BoxShape.circle
                          //     : BoxShape.rectangle,
                          borderRadius: changedButton
                              ? BorderRadius.circular(
                                  50) // cannot use with shape. One of the two can be used
                              : BorderRadius.circular(8)),
                    ),
                  )

                  // ElevatedButton(
                  //   onPressed: () {
                  //     // print("hello");
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: const Text("Login"),
                  //   style: TextButton.styleFrom(
                  //       elevation: 4.0,
                  //       backgroundColor: Colors.cyan,
                  //       // shadowColor: Colors.green
                  //       minimumSize: Size(100, 40),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8))),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
