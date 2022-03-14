import 'package:flutter/material.dart';
import 'package:udemy_course/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                defaultFormField(
                  validatedText: 'Email Address',
                  textType: TextInputType.emailAddress,
                  textController: emailController,
                  preficon: Icons.email_rounded,
                  labelText: 'Email Address',
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  labelText: 'Password',
                  preficon: Icons.lock,
                  textController: passwordController,
                  textType: TextInputType.visiblePassword,
                  validatedText: 'Password',
                  sofIcon: isPassword ? Icons.visibility : Icons.visibility_off,
                  onPressedSofix: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  security: isPassword ? true : false,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  text: 'LoGin',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an Account'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'REGISTER NOW',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
