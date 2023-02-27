import 'package:flutter/material.dart';

class FormExample1 extends StatefulWidget {
  const FormExample1({Key? key}) : super(key: key);

  @override
  State<FormExample1> createState() => _FormExample1State();
}

class _FormExample1State extends State<FormExample1> {

  //controllers for form fileds
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var email,password;
  //creating a form key
  final _loginform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form"),
      ),
      body: Column(
        children: [
          Form(
            //key is used to handle data from the concerned form
              key: _loginform,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email id";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Enter email",
                        labelText: "Email-id",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_loginform.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Success")));
                            }

                            setState(() {
                              email=emailController.text;
                              password=passwordController.text;
                            });
                          },
                          child: Text("Login"))),

                  Text("Your email id is ${email} and password is ${password} ")
                ],
              ))
        ],
      ),
    );
  }
}
