import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmpasswordTextController = TextEditingController();

  void signUp() async {
    if (passwordTextController.text != confirmpasswordTextController.text) {
      displayMessage("Contraseña no son iguales");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible:
          false, // Evita que se cierre al tocar fuera del diálogo
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email!)
          .set({
        'Username': emailTextController.text.split('@')[0],
        'bio': 'empty bio..'
      });

      // Pop el cuadro de diálogo solo si el widget todavía está montado
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // Pop el cuadro de diálogo solo si el widget todavía está montado
      if (mounted) {
        Navigator.pop(context);
        displayMessage(e.code);
      }
    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  //logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  SizedBox(height: 50),

                  //welcome back message
                  Text(
                    "Vamos a crear una cuenta para ti",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),

                  SizedBox(height: 25),

                  //email textfield
                  MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  SizedBox(height: 10),

                  //confirm password textfield
                  MyTextField(
                    controller: confirmpasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  SizedBox(height: 25),

                  //sign in button
                  MyButton(
                    onTap: signUp, // <-- Use widget.onTap here
                    text: 'Sign Up',
                  ),

                  SizedBox(height: 25),

                  //go to login page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have an account?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap, // <-- Use widget.onTap here
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
