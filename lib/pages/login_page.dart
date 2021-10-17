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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

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
        child: Form(
          key: _formKey,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password must have atleast 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Material(
                      color: Colors.cyan,
                      borderRadius:
                          BorderRadius.circular(changedButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
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
                          // decoration: BoxDecoration(   // decoration part was shifted in to material above for ripple effect
                          //     color: Colors.cyan,
                          // shape: changedButton
                          //     ? BoxShape.circle
                          //     : BoxShape.rectangle,
                          // borderRadius: changedButton
                          //     ? BorderRadius.circular(
                          //         50) // cannot use with shape. One of the two can be used
                          //     : BorderRadius.circular(8)),
                        ),
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
      ),
    ));
  }
}
