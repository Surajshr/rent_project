import 'package:flutter/material.dart';

import 'Inirial_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 30,bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "images/home.png",
                width: 500,
                height: 200,
              ),
              const Center(
                child: Text(
                  "Welcome to Rental!..!",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
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
                      color: Colors.black,
                      fontFamily: 'Hubballi',
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2))),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text(
                  'Button',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Hubballi',
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => initialPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // <-- Radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Hubballi',
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 20),
                child: Divider(
                  thickness: .5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  height: 20,
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'Continue with Google',
                  style: TextStyle(
                      fontSize: 24, fontFamily: 'Hubballi', color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xCBB81A66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // <-- Radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text(
                  'Continue with Facebook',
                  style: TextStyle(
                      fontSize: 24, fontFamily: 'Hubballi', color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0x971A2FB8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // <-- Radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ), SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text(
                  'Continue with Twitter',
                  style: TextStyle(
                      fontSize: 24, fontFamily: 'Hubballi', color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xB45DE835),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // <-- Radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
