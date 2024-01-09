import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Thirdpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 104,
        width: 104,
        child: SvgPicture.asset("assets/images/Logo112.svg"),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
            children:[
              SvgPicture.asset("assets/images/Logo11.svg",semanticsLabel: 'Acme Logo',),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Lets begin",

                          style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      )),
                ],

                // children: [
                //   Text("Lets begin",
                //       textAlign:TextAlign.right,
                //       style: GoogleFonts.poppins(
                //     fontSize: 22,
                //     fontWeight: FontWeight.w700,
                //   )),
                //
                // ],
              ),
              Text("Login with your google account to continue journey to world of Electronics gadgets ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
              ),

              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Thirdpage()),
                );
              }, child: Text("Sign in with google")),


            ],
          ),
        ),
    );
  }
}
