import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/sign_in.dart';
import 'package:flutter_application_1/components/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final secondpasswordController = TextEditingController();

  Future<void> signUserUp() async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: usernameController.text,
        // additional attributes as needed
        // CognitoUserAttributeKey.phoneNumber: '+15559101234',
      };
      // const result =
      await Amplify.Auth.signUp(
        // TODO: Add username field
        username: uuid(),
        password: passwordController.text,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      // TODO: use sucessfull result to redirect user
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Icon(
                  Icons.phone_android,
                  size: 100.0,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Sign up for a fresh account',
                ),
                const SizedBox(
                  height: 40,
                ),
                MyTextField(
                    controller: usernameController,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(height: 10),
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(height: 10),
                MyTextField(
                    controller: secondpasswordController,
                    hintText: "Re-Enter Password",
                    obscureText: true),
                const SizedBox(height: 20),
                MyButton(onTap: signUserUp),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Already a user?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
