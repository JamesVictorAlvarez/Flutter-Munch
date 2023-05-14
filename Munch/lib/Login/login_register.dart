import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:munch/Login/admin_login.dart';
import '../auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        prefixIconColor: Color(0xFFE85852),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: title,
        labelStyle: TextStyle(color: Color(0xFFE85852)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: Colors.redAccent)),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xFFE85852),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin ? 'SignUp' : 'Login',
        style: TextStyle(
            fontFamily: 'poppins',
            color: Color(0xFFE85852),
            fontWeight: FontWeight.w600,
            fontSize: 19),
      ),
    );
  }

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
                        'Munch',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFFE85852),
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 14),
                    _entryField('Email', _emailController),
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
                    _submitButton(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an Account? ",
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                        GestureDetector(
                            onTap: () {}, child: _loginOrRegisterButton()),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _errorMessage(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AdminLogin())
                          );
                        },
                        child: Text(
                          'Admin Login',
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
