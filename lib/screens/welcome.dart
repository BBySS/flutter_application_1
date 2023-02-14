import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Image.asset("assets/images/welcome.png"),
              const SizedBox(height: 50),
              Text(
                'Hello',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: SizedBox(
                        width: 450,
                        child: LoginSignupBtn(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
