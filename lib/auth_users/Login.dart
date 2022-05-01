import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:revivefrr/controllers/google_signin_controller.dart';
import 'package:revivefrr/getStarted/first_choice.dart';
import 'package:revivefrr/pages/SecondHome.dart';

import 'Registration.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:studygroup/src/screens/dashboard.dart';
// import 'package:studygroup/src/screens/verify.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //form key
  final _formKey = GlobalKey<FormState>();

  //modifier les controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // late String _email, _password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {


    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value)
      {
        // value!.replaceAll(' ', '');
        if(value!.isEmpty) {
          return ('Please Enter your Email');
        }
        //reg expression for email validation
        if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value))
        {
          return ('Please enter a Valid Email!');
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.mail),
          hintText: 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty)
        {
          return ('Password is required for login');
        }
        if(!regex.hasMatch(value)) {
          return ('Enter Valid Password(Min. 6 Character)');
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.vpn_key),
          hintText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );

    //login boutton
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.brown,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text.trim(), passwordController.text);
        },
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );



    return Scaffold(

      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.angle_left, color: Colors.brown,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstChoice()));
            // Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/raw4.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.3), BlendMode.dstATop),
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                // color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:40),
                      Text('LOGIN TO', style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        color: Colors.brown,
                        fontFamily: 'BadScript',
                      ),),

                      SizedBox(height:120,
                        child: Image.asset('assets/ebiblio2.png',fit: BoxFit.contain, height: 170,),),

                      SizedBox(height:80),
                      emailField,
                      SizedBox(height:10),
                      passwordField,
                      SizedBox(height:10),
                      loginButton,
                      // IconButton(
                      //     onPressed: () {
                      //       Provider.of<LoginController>(context, listen: false).googleLogin();
                      //       setState(() {});
                      //     },
                      //     icon: Icon(LineAwesomeIcons.google_logo),
                      // ),

                      // ElevatedButton.icon(
                      //     onPressed: () {
                      //       Provider.of<LoginController>(context, listen: false).googleLogin();
                      //       setState(() {});
                      //       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondHome()), (route) => false);
                      //       },
                      //     icon: Icon(LineAwesomeIcons.google_logo),
                      //     label: Text('google')
                      // ),
                      // ElevatedButton(
                      //     onPressed: () {Provider.of<LoginController>(context, listen: false).logout();},
                      //     child: Text('logout')
                      // ),

                      SizedBox(height:150,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<LoginController>(context, listen: false).googleLogin();
                              setState(() {});
                            },
                            child: CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage('assets/google.png')),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<LoginController>(context, listen: false).FBLogin();
                              setState(() {});
                            },
                            child: CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage('assets/fb.png')),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<LoginController>(context, listen: false).TwLogin();
                              setState(() {});
                            },
                            child: CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage('assets/twitter.png')),
                          ),
                        ],
                      ),
                      SizedBox(height:25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                              },
                              child : Text(
                                "SignUp",
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )


                          )
                        ],

                      ),
                    ],
                  ),
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
  //login function
  void signIn(String email, String password) async{
    if(_formKey.currentState!.validate())
    {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: 'Login Successful'),
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondHome()), (route) => false)
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      },
      );
    }
  }

}



// import 'package:flutter/material.dart';
// import 'package:revivefrr/pages/SecondHome.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('yes'),
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10,),
//           Container(
//             child: Center(child: Image(image: AssetImage('assets/e-biblio.png'),width: 320,)),
//           ),
//           SizedBox(height: 20,),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondHome()), (route) => false);
//               },
//               child:Text('go frere') ,
//           )
//
//         ],
//       ),
//     );
//   }
// }
