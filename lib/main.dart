import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro31/Thirdpage.dart';
import 'package:sign_in_button/sign_in_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBr12E7ktX8NwWlKb0P11qlhAfI46TC22c",
      appId: "1:1026123339623:android:b757cd47f785d1594881c2",
      messagingSenderId: "1026123339623",
      projectId: "pro3-f9139",
    ),
  );
  runApp(const MyApp());


}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                    LoginPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 104,
          width: 104,
          child: SvgPicture.asset("assets/images/Logo112.svg",fit: BoxFit.fill,),
        ),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error during Google sign-in: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: SvgPicture.asset("assets/images/Logo11.svg",semanticsLabel: 'Acme Logo',),
                  ),
                  SizedBox(height: 49),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Let's begin",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login with your google account to continue journey to world of electronic gadgets',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: SignInButton(
                    Buttons.google,
                    onPressed: () async {
                      User? user = await _handleSignIn();
                      print('Welcome${user!.displayName.toString()}');
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Thirdpage(user, name: '',),
                          ),
                        );
                      }
                    },
                  ),
                )
                ],
              ),
            ),
          ),
        )
    );
  }
}

// class UserDetailsPage extends StatelessWidget {
//   final User user;
//
//   UserDetailsPage(this.user);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Details"),
//         actions: [],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Welcome, ${user.displayName}"),
//             Text("Email: ${user.email}"),
//             Text("UID: ${user.uid}"),
//             IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 await GoogleSignIn().signOut();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Thirdpage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_button/sign_in_button.dart';
// import 'Thirdpage.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyBr12E7ktX8NwWlKb0P11qlhAfI46TC22c",
//       appId: "1:1026123339623:android:b757cd47f785d1594881c2",
//       messagingSenderId: "1026123339623",
//       projectId: "pro3-f9139",
//     ),
//   );
//   runApp(const MyApp());
//
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, });
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3),
//             ()=>Navigator.pushReplacement(context,
//             MaterialPageRoute(builder:
//                 (context) =>
//                 SecondScreen()
//             )
//         )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 104,
//           width: 104,
//           child: SvgPicture.asset("assets/images/Logo112.svg"),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatefulWidget {
//   const SecondScreen({super.key});
//
//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }
// class _SecondScreenState extends State<SecondScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//           children:[
//             Container(
//               color: Color(0xff4b0098),
//             ),
//             SvgPicture.asset("assets/images/Logo11.svg",semanticsLabel: 'Acme Logo',),
//             SizedBox(height: 20,),
//             Row(
//               children: [
//                 Text("Lets begin",
//                         style: GoogleFonts.poppins(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                     )),
//               ],
//             ),
//             Text("Login with your google account to continue journey to world of Electronics gadgets ",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 )
//             ),
//             SizedBox(height: 40,),
//             SignInButton(
//               Buttons.google,
//               text: "Sign up with Google",
//               onPressed: () {},
//             )
//           ],
//         ),
//     );
//   }
// }
// class LoginPage extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   Future<User?> _handleSignIn() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//       final User? user = authResult.user;
//       return user;
//     } catch (error) {
//       print("Error during Google sign-in: $error");
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text("Login with Google"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             User? user = await _handleSignIn();
//             print('dataaaaaaaaaaaaaa${user!.displayName.toString()}');
//             if (user != null) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => UserDetailsPage(user),
//                 ),
//               );
//             }
//           },
//           child: Text("Sign In with Google"),
//         ),
//       ),
//     );
//   }
// }
//
// class UserDetailsPage extends StatelessWidget {
//   final User user;
//
//   UserDetailsPage(this.user);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Details"),
//         actions: [],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Welcome, ${user.displayName}"),
//             Text("Email: ${user.email}"),
//             Text("UID: ${user.uid}"),
//             IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 await GoogleSignIn().signOut();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Thirdpage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }}