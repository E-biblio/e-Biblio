import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:revivefrr/model/user_model.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginController with ChangeNotifier {
  //object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  UserModel? userModel;

  //function for google login
  Future googleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

  //apres règle ce problème d'ajout-user Amine ok?
    //update: tout est niquel :)

    await FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isNotEqualTo: this._user!.id)
        .get()
        .then((value) => {
      'uid': this._user!.id,
      'userName': this._user!.displayName,
      'email': this._user!.email,
    });

    // await FirebaseFirestore.instance.collection('users').add({
    //   'uid': this._user!.id,
    //   'userName': this._user!.displayName,
    //   'email': this._user!.email,
    // });

    // this.userModel = UserModel(
    //   uid: this._user!.id,
    //   userName: this._user!.displayName,
    //   email: this._user!.email,
    // );
    //

    notifyListeners();
  }

  //function for fb login
  Future FBLogin() async {
    final loginResult = await FacebookAuth.i.login();
    final userData = await FacebookAuth.i.getUserData();

    final facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);



    // await FirebaseFirestore.instance.collection('users').add({
    //   'uid': userData['id'],
    //   'userName': userData['name'],
    //   'email': userData['email'],
    // });
    await FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isNotEqualTo: userData['id'])
        .get()
        .then((value) => {
      'uid': userData['id'],
      'userName': userData['name'],
      'email': userData['email'],
    });

  }

  //function for Twitter login
  Future TwLogin() async {
    final twitterLogin =  TwitterLogin(
      apiKey: 'XijEUSw9BopmwHtllC4M3W8z0',
      apiSecretKey: 'A0IGYwp5r6gxPzgdL9OmVuoZcmE6jHvSLrMMSeWh3o05mdBuFj',
      // redirectURI: 'https://revive-11dbb.firebaseapp.com/__/auth/handler',
      redirectURI: 'revivefrr://',
    );




    await twitterLogin.loginV2().then((value) async {
      final authToken = value.authToken;
      final authTokenSecret = value.authTokenSecret;
      if (authToken != null && authTokenSecret != null){
        final twitterAuthCredentials = TwitterAuthProvider.credential(accessToken: authToken, secret: authTokenSecret,);
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredentials);
      } else {
        print(authToken);
        print('Amine regle ce problème et vite');
      }
    });



    // await FirebaseFirestore.instance
    //     .collection('Users')
    //     .where('uid', isNotEqualTo: userModel!.uid)
    //     .get()
    //     .then((value) => {
    //   'uid': this._user!.id,
    //   'userName': this._user!.displayName,
    //   'email': this._user!.email,
    // });
    // final authResult = await twitterLogin.login();
    //
    // final twitterAuthCredential =  TwitterAuthProvider.credential(
    //   accessToken: authResult.authToken!,
    //   secret: authResult.authTokenSecret!,
    // );
    // await twitterLogin.login().then((value) async {
    //   final twitterAuthCredential = TwitterAuthProvider.credential(accessToken: value.authToken!, secret: value.authTokenSecret!);
    //
    // });
    // return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);




    // await FirebaseFirestore.instance.collection('users').add({
    //   'uid': userData['id'],
    //   'userName': userData['name'],
    //   'email': userData['email'],
    // });

    // await FirebaseFirestore.instance
    //     .collection('Users')
    //     .where('uid', isNotEqualTo: userData['id'])
    //     .get()
    //     .then((value) => {
    //   'uid': userData['id'],
    //   'userName': userData['name'],
    //   'email': userData['email'],
    // });

  }

      // .where('uid', isEqualTo: userData['id'])
  //logout

  logout() async {
    this._user = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();

    // userModel = null;
    print('Amineeeeeeeeeeeeeeeeeee');
    notifyListeners();
  }

}