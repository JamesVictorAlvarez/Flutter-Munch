import 'package:flutter/material.dart';
import 'package:munch/Admin/admin_home.dart';
import '../widget_tree.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _user = 'admin';
  final _pass = '123';

  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                        height: 100,
                        child: Image(
                            image: AssetImage('assets/images/banner.png'))),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _userController,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle),
                        prefixIconColor: const Color(0xFFE85852),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Color(0xFFE85852)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1.5, color: Colors.redAccent)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: isObscure,
                        cursorColor: Colors.redAccent,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: const Color(0xFFE85852),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: "Password",
                            labelStyle:
                                const TextStyle(color: Color(0xFFE85852)),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1.5, color: Colors.redAccent)),
                            suffixIcon: IconButton(
                                icon: Icon(isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                }),
                            suffixIconColor: const Color(0xFFE85852))),
                    const SizedBox(height: 35),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFE85852),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (_userController.value.text.isEmpty ||
                              _passwordController.value.text.isEmpty) {
                            setState(() {
                              errorMessage = 'All fields must be filled';
                            });
                          } else if (_userController.text != _user ||
                              _passwordController.text != _pass) {
                            setState(() {
                              errorMessage = 'Incorrect username or password';
                            });
                          } else if (_userController.text == _user ||
                              _passwordController.text == _pass) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdminHome()));
                          }
                        },
                        child: const Text('Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(errorMessage == '' ? '' : 'Humm ? $errorMessage'),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WidgetTree()));
                        },
                        child: const Text(
                          'Back to Login',
                          style: TextStyle(color: Color(0xFFE85852)),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
