import 'package:flutter/material.dart';
import 'package:munch/Admin/admin_home.dart';
import '../widget_tree.dart';
import 'login_register.dart';

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
    bool _isObscure = true;
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
                    SizedBox(
                      height: 40,
                      child: Text(
                        'Admin Login',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFFE85852),
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextField(
                      controller: _userController,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        prefixIconColor: Color(0xFFE85852),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color(0xFFE85852)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1.5, color: Colors.redAccent)),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: _isObscure,
                        cursorColor: Colors.redAccent,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Color(0xFFE85852),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Color(0xFFE85852)),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.redAccent)),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            suffixIconColor: Color(0xFFE85852))),
                    const SizedBox(height: 35),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFE85852),
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                          } else if ( _userController.text == _user ||
                              _passwordController.text == _pass){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminHome())
                            );
                          }
                        },
                        child: Text('Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(errorMessage == '' ? '' : 'Humm ? $errorMessage'),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WidgetTree()));
                        },
                        child: Text(
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
