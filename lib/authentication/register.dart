import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String username = "";
  String email = "";
  String password = "";
  String _errorMessage = "";

  // function to toggle the password visibility
  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register your account!'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Register",
                    style: TextStyle(fontSize: 30)),
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "username",
                      labelText: "username",
                      icon: Icon(Icons.people, color: Colors.lightGreen),
                    ),
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username tidak boleh kosong!";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "email",
                      labelText: "email",
                      icon: Icon(Icons.email, color: Colors.lightGreen),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong!";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    obscureText: showPassword ? false : true,
                    decoration:  InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      suffixIcon: GestureDetector(
                        onTap:() {
                          togglePasswordVisibility();
                        },
                        child: Icon(
                          showPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.lightGreen,
                        ),
                      ),
                      icon: const Icon(Icons.lock, color: Colors.lightGreen),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong!";
                      }
                      return null;
                    }
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Submit",
                      style: TextStyle(fontSize: 20, color: Colors.white)
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      username = usernameController.text;
                      email = emailController.text;
                      password = passwordController.text;

                      // "https://cultural-center.com/authentication/login/"
                      // "http://127.0.0.1:8000/authentication/login/"
                      final response = await request
                        .login("https://cultural-center.up.railway.app/authentication/register/", {
                      'username': username,
                      'email': email,
                      'password': password,
                      });

                      if (response["status"] == true) {
                        // ignore: use_build_context_synchronously
                        // show success message
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Berhasil!'),
                          ),
                        );
                        // Navigator.of(context).pop();
                      } else {
                        setState(() {
                          _errorMessage = response["message"];
                        });
                      }
                    }
                  }
                ),
                const SizedBox(height: 20),
                Text(_errorMessage),
              ]
            )
          )
        )
      )
    );
  }
}