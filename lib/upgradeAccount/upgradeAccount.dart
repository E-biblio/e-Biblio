import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/userInfo_model.dart';

class UpgradeAccount extends StatefulWidget {
  const UpgradeAccount({Key? key}) : super(key: key);

  @override
  State<UpgradeAccount> createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeAccount> {
  User? user = FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context) {

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Upgrade Account'),
        centerTitle: true,
        elevation: 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:120,
              child: Image.asset('assets/ebiblio2.png',fit: BoxFit.contain,),),
            Container(
              height: 500,
              color: Colors.black12,
              child: SingleChildScrollView(child: Text('These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and e-biblio ("Company," “we," “us," or “our”), concerning your access to and use of the e-biblio.com website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the “Site”). You agree that by accessing the Site, you have read, understood, and agreed to be bound by all of these Terms of Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS OF USE, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SITE AND YOU MUST DISCONTINUE USE IMMEDIATELY.Supplemental terms and conditions or documents that may be posted on the Site from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Terms of Use at any time and for any reason. We will alert you about any changes by updating the “Last updated” date of these Terms of Use, and you waive any right to receive specific notice of each such change. Please ensure that you check the applicable Terms every time you use our Site so that you understand which Terms apply. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms of Use by your continued use of the Site after the date such revised Terms of Use are posted.The information provided on the Site is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Site from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.You may be required to register with the Site. You agree to keep your password confidential and will be responsible for all use of your account and password. We reserve the right to remove, reclaim, or change a username you select if we determine, in our sole discretion, that such username is inappropriate, obscene, or otherwise objectionable.', style: TextStyle(fontSize: 16, color: Colors.black87),)),

            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color:Colors.brown,
                  borderRadius: BorderRadius.circular(5),
                  child: MaterialButton(
                      onPressed: () {},
                    child: Text('Annuler',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18, color: Colors.white, )),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 180,
                  ),
                ),
                SizedBox(width: 10,),
                Material(
                  color:Colors.brown,
                  borderRadius: BorderRadius.circular(5),
                  child: MaterialButton(
                    onPressed: () {
                      confirm();
                      print('c fait');
                      //pop up validation success
                      //just a coté du name y'aura (seller)
                      //function to return the old account
                      //change icon and title
                      //si possible: l'accès au camera pour agora
                    },
                    child: Text('Accept Terms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, color: Colors.white, )),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 180,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
  confirm() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    UserInfos userInfos = UserInfos();

    userInfos.upgraded = true as Bool?;

    // await CircularProgressIndicator();
    // Navigator.of(context).pop();
    // await firebaseFirestore.collection('UserInfo').doc('upgraded').update();
  }
}
