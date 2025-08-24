import 'package:flutter/material.dart';
import 'package:shopping_app/homepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formkey = GlobalKey<FormState>();
  bool isObsucre1 = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF667EEA),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffD6D3D1)),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.82,
              height: MediaQuery.of(context).size.height * 0.62,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Text("Welcome back",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Color(0xff8E51FF)),),
                        Text("Join ShopCraft today",),
                        const SizedBox(height: 10,),
                        Align(alignment : Alignment.topLeft ,child: Text("Email",style: TextStyle(fontWeight: FontWeight.bold),)),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Email is needed";
                            }
                            if(!value.contains('@')){
                              return "Invalid email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Enter your email",
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Align(alignment : Alignment.topLeft ,child: Text("Password",style: TextStyle(fontWeight: FontWeight.bold),)),
                        TextFormField(
                          obscureText: isObsucre1,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password is needed";
                            }
                            if(value.length < 6){
                              return "Too short password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Enter your password",
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isObsucre1 = !isObsucre1;
                                });
                              },
                              icon: Icon(isObsucre1 ? Icons.visibility : Icons.visibility_off),
                            )
                          ),
                        ),
                        const SizedBox(height: 15,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff8E51FF)),
                          ),
                          onPressed: (){
                            if(_formkey.currentState!.validate()){
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Center(child: Text("Welcome back!",style: TextStyle(color: Color(0xff2AA63E),fontSize: 20.0,fontWeight: FontWeight.bold),)),
                                    content: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.6,
                                        height: MediaQuery.of(context).size.height * 0.1,
                                        child: Column(
                                          children: [
                                            Text("Account signed-in successfully"),
                                            const SizedBox(height: 10,),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xff2AA63E)),
                                              ),
                                              onPressed: (){
                                                Navigator.of(context).pushAndRemoveUntil(
                                                  PageRouteBuilder(
                                                    transitionDuration: Duration(milliseconds: 800),
                                                    pageBuilder: (context,animation,secondaryAnimation) => HomePage(),
                                                    transitionsBuilder: (context, animation, secondaryAnimation, child){
                                                      return FadeTransition(opacity: animation,child: child,);
                                                    },
                                                  ),
                                                  (routr) => false, 
                                                );
                                              },
                                              child: Text("Cancel",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              );
                            }
                          },
                          child: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}