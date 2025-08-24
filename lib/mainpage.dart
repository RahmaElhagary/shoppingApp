import 'package:flutter/material.dart';
import 'package:shopping_app/signin.dart';
import 'package:shopping_app/signup.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF667EEA),
      appBar: AppBar(
        title: Text(
          "ShoppingApp",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Suwannaphum-Regular",
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF667EEA),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Center(
            child: Container(
              color: Color(0xFF667EEA),
              child: Padding(
                padding: const EdgeInsets.only(
                  top:170.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Your Premium Shopping Experience",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Suwannaphum-Regular",
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Image.asset(
                          "assets/image.jpg",
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        const SizedBox(width: 20.0),
                        Image.network(
                          "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGFwdG9wfGVufDB8fDB8fHww",
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage(),));
                          },
                          child: Text("Sign in"),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),));
                          },
                          child: Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
