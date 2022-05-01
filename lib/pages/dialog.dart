import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:revivefrr/model/userInfo_model.dart';
import 'package:revivefrr/pages/SecondHome.dart';
import 'package:revivefrr/pages/data_chip.dart';

import '../model/user_model.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {

  int _currentStep = 0;
  final double spacing = 8;
  bool check = false;
  bool isComplete = false;
  String? value;
  String? ville;
  StepperType stepperType = StepperType.vertical;
  final  villes = ['Agadir','Rabat', 'Marrakech', 'Fes', 'Chefchaouen', 'Essaouira', 'Casablanca', 'Tanger' ];

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ? setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }


  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
      child: Text(item, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),)
  );
  User? user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;
  List<String> type = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: isComplete ? confirm(ville!, type) :
      SingleChildScrollView(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // SizedBox(height: 80,),
                // Image.asset('assets/ebiblio2.png',fit: BoxFit.contain, height: 120,),
                Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue:() {
                    if(_currentStep == 2) {
                      setState(() {
                        isComplete = true;
                        //là Amine tu peux mettre la func qui envoie la data ok?
                      });
                    } else {
                      setState(() {
                        continued();
                      });
                    }
                    } ,
                    onStepCancel: cancel,
                    controlsBuilder: (BuildContext context, ControlsDetails controls) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: controls.onStepContinue,
                                child: _currentStep == 2 ? Text('Confirm'):Text('Next')
                            ),
                          ),
                          SizedBox(width: 10,),
                          if (_currentStep !=0)
                          Expanded(
                            child: ElevatedButton(
                                onPressed: controls.onStepCancel,
                                child: _currentStep == 0 ? null : Text('Cancel')
                            ),
                          ),
                        ],
                      ),
                    );
                    },
                    steps: [
                      Step(
                          title: Text('Enter Your City'),
                          content: Column(
                            children: [
                              DropdownButton<String>(
                                  items: villes.map(buildMenuItem).toList(),
                                  value: value,
                                  isExpanded: true,
                                  onChanged: (value) => setState(() {
                                    this.value = value;
                                    ville = value;
                                    print('yep its change');
                                  })
                              )
                              // TextFormField(
                              //   decoration: InputDecoration(labelText: 'City Here'),
                              // )
                            ],
                          ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0 ?
                        StepState.complete : StepState.disabled,
                      ),
                      Step(
                        title: Text('Your book Type'),
                        content: Column(
                          children: [
                            // TextFormField(
                            //   decoration: InputDecoration(labelText: 'Type Here'),
                            // ),
                            Wrap(
                              runSpacing: spacing,
                              spacing: spacing,
                              children: List<Widget>.generate(onChipContent.length, (int index) {
                                return FilterChip(
                                  // avatar: Icon(
                                  //   LineAwesomeIcons.user
                                  // ),
                                  padding: EdgeInsets.all(8.0),
                                  label: Text(onChipContent[index].label),
                                  labelStyle: TextStyle(color: onChipContent[index].color),
                                  backgroundColor: onChipContent[index].color.withOpacity(0.1),
                                  onSelected: (bool value) {
                                    setState(() {
                                      onChipContent[index].iseclect = value;
                                      if (onChipContent[index].iseclect == true) {
                                        final onichip = onChipContent[index].label;
                                        type.add(onichip);
                                      }

                                    });
                                  },
                                  selected: onChipContent[index].iseclect,
                                  checkmarkColor: onChipContent[index].color,
                                  selectedColor: onChipContent[index].color.withOpacity(0.35),
                                );
                              }),
                            ),

                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1 ?
                        StepState.complete : StepState.disabled,
                      ),
                      Step(
                        title: Text('Accept Condition'),
                        content: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Checkbox(
                              //     value: check,
                              //     onChanged: (bool? value) {
                              //       if (value != null) {
                              //         setState(() {
                              //           this.check = value;
                              //         });
                              //       }
                              //     }
                              // ),
                              FittedBox(child: Text('I accept term and condition,'
                                  ' privacy policy\ndetails in this link: https://e-biblio.com',
                                style: TextStyle(fontSize: 11.5),)),
                              // TextFormField(
                              //   decoration: InputDecoration(labelText: 'OK accept'),
                              // )
                            ],
                          ),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2 ?
                        StepState.complete : StepState.disabled,
                      ),
                    ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   confirm(String ville, List<String> type) async {
     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

     UserInfos userInfos = UserInfos();

     userInfos.uid = user!.uid;
     userInfos.ville = ville;
     userInfos.type = type;

     await CircularProgressIndicator();
     Navigator.of(context).pop();
     await firebaseFirestore.collection('UserInfo').doc(user!.uid).set(userInfos.toMap());





     // FirebaseFirestore.instance.collection('UserInfo').doc();
     //  final userInfos = UserInfos(
     //    uid : user!.uid,
     //    ville : ville,
     //    type : type
     //  );
      // await _auth.createUserWithEmailAndPassword(email: email, password: password)
      //     .then((value) => {postDetailsToFirestore()})
      //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.message);
      // });


  }

  // postDetailsToFirestore() async {
  //   //on va appeller notre firestore
  //   //on va appeler aussi notre user model
  //   //envoyer ces values
  //
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //
  //   UserModel userModel = UserModel();
  //
  //   //on va ecrire tous les values
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.userName = userNameEditingController.text;
  //
  //   await firebaseFirestore.collection('users').doc(user.uid).set(userModel.toMap());
  //   Fluttertoast.showToast(msg: 'Account created successfully ${userModel.userName}');
  //
  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondHome()), (route) => false);
  //
  //
  // }
}

/**************************************
 *  // Stepper(
    //     type: stepperType,
    //     physics: ScrollPhysics(),
    //     currentStep: _currentStep,
    //     onStepTapped: (step) => tapped(step),
    //     onStepContinue: () {
    //       if (_currentStep == 2) {
    //         setState(() {
    //           isComplete = true;
    //           //là Amine tu peux mettre la func qui envoie la data ok?
    //         });
    //       } else {
    //         setState(() {
    //           continued();
    //         });
    //       }
    //     },
    //     onStepCancel: cancel,
    //     controlsBuilder:
    //         (BuildContext context, ControlsDetails controls) {
    //       return Container(
    //         margin: EdgeInsets.only(top: 20),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: ElevatedButton(
    //                   onPressed: controls.onStepContinue,
    //                   child: _currentStep == 2
    //                       ? Text('Confirm')
    //                       : Text('Next')),
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             if (_currentStep != 0)
    //               Expanded(
    //                 child: ElevatedButton(
    //                     onPressed: controls.onStepCancel,
    //                     child: _currentStep == 0
    //                         ? null
    //                         : Text('Cancel')),
    //               ),
    //           ],
    //         ),
    //       );
    //     },
    //     steps: [
    //       Step(
    //         title: Text('Enter Your City'),
    //         content: Column(
    //           children: [
    //             DropdownButton<String>(
    //                 items: ville.map(buildMenuItem).toList(),
    //                 value: value,
    //                 isExpanded: true,
    //                 onChanged: (value) => setState(() {
    //                   this.value = value;
    //                   print('yep its change');
    //                 }))
    //             // TextFormField(
    //             //   decoration: InputDecoration(labelText: 'City Here'),
    //             // )
    //           ],
    //         ),
    //         isActive: _currentStep >= 0,
    //         state: _currentStep >= 0
    //             ? StepState.complete
    //             : StepState.disabled,
    //       ),
    //       Step(
    //         title: Text('Your book Type'),
    //         content: Column(
    //           children: [
    //             // TextFormField(
    //             //   decoration: InputDecoration(labelText: 'Type Here'),
    //             // ),
    //             Wrap(
    //               runSpacing: spacing,
    //               spacing: spacing,
    //               children: List<Widget>.generate(
    //                   onChipContent.length, (int index) {
    //                 return FilterChip(
    //                   // avatar: Icon(
    //                   //   LineAwesomeIcons.user
    //                   // ),
    //                   padding: EdgeInsets.all(8.0),
    //                   label: Text(onChipContent[index].label),
    //                   labelStyle: TextStyle(
    //                       color: onChipContent[index].color),
    //                   backgroundColor:
    //                   onChipContent[index].color.withOpacity(0.1),
    //                   onSelected: (bool value) {
    //                     setState(() {
    //                       onChipContent[index].iseclect = value;
    //                     });
    //                   },
    //                   selected: onChipContent[index].iseclect,
    //                   checkmarkColor: onChipContent[index].color,
    //                   selectedColor: onChipContent[index]
    //                       .color
    //                       .withOpacity(0.35),
    //                 );
    //               }),
    //             ),
    //           ],
    //         ),
    //         isActive: _currentStep >= 0,
    //         state: _currentStep >= 1
    //             ? StepState.complete
    //             : StepState.disabled,
    //       ),
    //       Step(
    //         title: Text('Accept Condition'),
    //         content: Row(
    //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           // crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Checkbox(
    //                 value: check,
    //                 onChanged: (bool? value) {
    //                   if (value != null) {
    //                     setState(() {
    //                       this.check = value;
    //                     });
    //                   }
    //                 }),
    //             FittedBox(
    //                 child: Text(
    //                   'I accept term and condition,'
    //                       ' privacy policy\ndetails in this link: https://e-biblio.com',
    //                   style: TextStyle(fontSize: 13),
    //                 )),
    //             // TextFormField(
    //             //   decoration: InputDecoration(labelText: 'OK accept'),
    //             // )
    //           ],
    //         ),
    //         isActive: _currentStep >= 0,
    //         state: _currentStep >= 2
    //             ? StepState.complete
    //             : StepState.disabled,
    //       ),
    //     ]),
 */
