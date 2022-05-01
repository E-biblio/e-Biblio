import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:revivefrr/auth_users/Login.dart';
// import 'package:revivefrr/leftMenu/zoomPage.dart';
import 'package:revivefrr/pages/SecondHome.dart';
// import 'package:revivefrr/pages/welcome.dart';
import 'getStarted.dart';

class FirstChoice extends StatefulWidget {
  const FirstChoice({Key? key}) : super(key: key);

  @override
  State<FirstChoice> createState() => _FirstChoiceState();
}

class _FirstChoiceState extends State<FirstChoice> {
  bool circle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/raw4.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.3), BlendMode.dstATop),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            child: Column(
              children: [
                Text('WELCOME TO E-BIBLIO', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                  color: Colors.brown,
                  fontFamily: 'BadScript',
                ),),
                SizedBox(height: 20,),
                // Image.asset('assets/team.png'),
                Image.asset('assets/amico.png'),

                // Image.asset('assets/flygirl.gif'),
                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    'Reading is just like have fun in what we do with affection '
                        'that because we are just humain with some dreams so for that just get Started.',
                    style: TextStyle(
                      color: Colors.brown,
                        fontSize: 19,
                        fontFamily: 'Yellowtail', letterSpacing: 0.1),
                    textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      setState(() {
                        circle = !circle;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => StreamBuilder(
                            stream: FirebaseAuth.instance.authStateChanges(),
                             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator(),);
                              } else if (snapshot.hasData) {
                                return SecondHome();
                              } else if (snapshot.hasError) {
                                return Center(child: Text('Sometimes errors are fun!'),);
                              } else {
                                return LoginScreen();
                              }

                        },
                      )
                      ));
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (
                      //     context) => SecondHome()),(route) => false);
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.brown
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: circle
                        ?CircularProgressIndicator(color: Colors.black,)
                        :Text("Login", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,),),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.brown,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => getStarted()));
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.brown
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


