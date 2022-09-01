import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rent_project/Dashboard.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/common/textFirld/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 90.0),
              child: Center(
                child: Text(
                  "RENTAL System",
                  style: TextStyle(fontSize: 45.0, fontFamily: 'Hubballi'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Welcome to Rental!..!",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'Hubballi'),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: 'Hubballi',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      fieldType: FieldType.email,
                      hintText: "Email",
                      label: "Email",
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      fieldType: FieldType.password,
                      hintText: "Password",
                      label: "Password",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signIn();
                            print("hello");
                          }
                        },
                        label: 'SignIn',
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'or',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Hubballi',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
              child: Divider(
                thickness: .5,
                indent: 20,
                endIndent: 20,
                color: Colors.white,
                height: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage("images/googleLogo.png"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Hubballi',
                          color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () async {
                  await signup(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xf1f1f1f1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
