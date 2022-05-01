import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:revivefrr/model/userInfo_model.dart';
import 'package:revivefrr/pages/data_SecondHome.dart';
import 'package:revivefrr/pages/data_recomm.dart';
import 'package:revivefrr/pages/dialog.dart';
import 'package:revivefrr/pages/more_recommended.dart';
import 'package:revivefrr/upgradeAccount/upgradeAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_users/Login.dart';
import '../controllers/google_signin_controller.dart';
import '../model/user_model.dart';
import '../style_key.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({Key? key}) : super(key: key);

  @override
  _SecondHomeState createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  bool selected = false;
  bool justone = false;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  UserInfos userInfos = UserInfos();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('users').doc(user!.uid).get().then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    FirebaseFirestore.instance.collection('UserInfo').doc(user!.uid).get().then((value) {
      this.userInfos = UserInfos.fromMap(value.data());
      setState(() {});
    });
    // final userCollection = FirebaseFirestore.instance.collection('UserInfo').where('ville', whereIn: );
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .where('uid', isNull:null)
    //     .get()
    //     .then((value) => {
    //   openDialog()
    // });
  }





  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 13,
      decoration: BoxDecoration(
        color: _current == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future<bool?> showWarning(BuildContext context) async {
    return showDialog<bool>(
      context : context,
      builder : (context) => AlertDialog(
        title: Text("Warning!"),
        content: Text("Do you want to logout?!"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Yes")),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "Nop",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }




  // void setStateIfMounted(openDialog()) {
  //   if (this.mounted) {
  //     setState(openDialog());
  //   }
  // }






  @override
  Widget build(BuildContext context) {
    void openDialog()  async{
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20),
              // title: Text('Steps to do'),
              content: SingleChildScrollView(
                child: Column(
                  // alignment: Alignment.topCenter,
                  // overflow: Overflow.visible,
                  children: [
                    Container(
                        height: 80,
                        // color:Colors.blue,
                        child: Image.asset('assets/ebiblio2.png',fit: BoxFit.contain, height: 80,)
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 350,
                      child: MyDialog(),

                    ),
                  ],
                ),
              ))
      );
    }
    // Amine n'oublie pas de modifié ça psk c'est lah ihsen la3wan ce que t'as fais là mon gars
    // c'est bon c fait :)
    Future.delayed(Duration(seconds: 4), () {
    if (userInfos.ville == null) {
      if (justone == false) {
        justone = true;
        openDialog();
        print(userInfos.ville);
      ;}
    }});
    //  FirebaseFirestore.instance
    //     .collection('UserInfo')
    //     .where('ville')
    //     .get()
    //     .then((value) => {
    //       openDialog()
    // });

    Future<void> logout(BuildContext context) async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    dynamic drawerHeader = UserAccountsDrawerHeader(
        accountName: loggedInUser.userName == null ?
                            Text('${user!.displayName}'.toUpperCase()) :
                            Text('${loggedInUser.userName}'.toUpperCase()),


        // arrowColor: Colors.indigo,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        accountEmail: loggedInUser.email == null ?
        Text('${user!.email}') :
        Text('${loggedInUser.email}'),
                currentAccountPicture: CircleAvatar(
          backgroundImage:
                    user!.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : AssetImage('assets/avatar3.png') as ImageProvider,
          // AssetImage('assets/avatar3.png'),
          // NetworkImage(user!.photoURL!),
        ),
      otherAccountsPictures: [
        IconButton(icon:Icon(Icons.logout), color: Colors.white, onPressed: () {
          logout(context);
          Provider.of<LoginController>(context, listen: false).logout();
          },),
      ],
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        // Divider(thickness: 1,),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: const Text('Market Place', style: TextStyle(fontSize: 18,),),
          ),

          leading: Icon(LineAwesomeIcons.store),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Ondialogue()));

              // setState(() {
              //   Ondialogue();
              //   print('rien nest gratuit');
              // });
            // setState(() {
            //   setStateIfMounted(openDialog);
            // });

          },
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: const Text('Upgrade Account', style: TextStyle(fontSize: 18,),),
          ),
          leading: Icon(LineAwesomeIcons.business_time),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradeAccount()));
          },
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: const Text('Message Page', style: TextStyle(fontSize: 18,),),
          ),
          leading: Icon(LineAwesomeIcons.facebook_messenger),
          onTap: (){},
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: const Text('Invitez un Ami', style: TextStyle(fontSize: 18,),),
          ),
          leading: Icon(LineAwesomeIcons.telegram),
          onTap: (){},
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: const Text('Contact E-biblio', style: TextStyle(fontSize: 18,),),
          ),
          leading: Icon(LineAwesomeIcons.envelope),
          onTap: (){},
        ),

        Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.qrcode, color: Colors.white,)),
            IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.invision, color: Colors.white,))
          ],
        ),



      ],
    );
    // Timer timer;
    // void autoPress(){
    //   timer = new Timer(const Duration(seconds:2),(){
    //     print("This line will print after two seconds");
    //   });
    // }





    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        drawerEdgeDragWidth: 50,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          // title:
          // Icon(LineAwesomeIcons.bars, color: Colors.black),
          // IconButton(icon: Icon(LineAwesomeIcons.bars, color:Colors.black ,), onPressed: () {  },),
          actions: [
            IconButton(icon: Icon(LineAwesomeIcons.user,color: Colors.black,), onPressed: () {},),
          ],),
        drawer: Drawer(
          child:
          drawerItems,
          // Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('assets/raw6.jpg'),
          //           fit: BoxFit.cover,
          //           colorFilter: new ColorFilter.mode(
          //               Colors.white.withOpacity(0.6),
          //               BlendMode.dstATop),
          //         )
          //     ),
          //     child: drawerItems
          // ),

          backgroundColor: Colors.black87,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ElevatedButton(onPressed:() {
              //   openDialog();
              //    } ,
              //     child: Text('click')),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Hi ${
                        loggedInUser.userName == null ?
                        user!.displayName :
                        loggedInUser.userName
                    } :)', style: TextStyle(fontSize: 18, ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recommended for You', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0, right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SeeRecommended()));
                            },
                              child: Text('See More>', style: TextStyle(fontSize: 15,decoration: TextDecoration.underline ),)
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      onPageChanged: (value, carousel) {
                        setState(() {
                          _current = value;
                        });
                      }
                    ),
                    itemCount: imgBook.length,
                    itemBuilder: (BuildContext context, index, realIdx ) {
                       if (userInfos.type == null) {
                        return Stack(
                          children: [
                            Opacity(
                              opacity: 0.3,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child:  Image(image:AssetImage(imgList[index]),
                                    fit: BoxFit.cover,height: 200,width: 360,)
                              ),
                            ),

                          ],
                        );
                      }if (userInfos.type!.contains(onFictif[index].type)) {
                        return Stack(
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child:  Image(image:AssetImage(imgList[index]),
                                    fit: BoxFit.cover,height: 200,width: 360,)
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 15,
                              child: Image(image: AssetImage(onFictif[index].imageBook),height: 170,),
                            ),
                            Positioned(
                                right: 50,
                                top: 15,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(onFictif[index].imageProfil),
                                  radius: 43,
                                )
                            ),
                            Positioned(
                              left:124,
                              top:100,
                              child: Container(
                                  height: 30,
                                  width: 190,
                                  // color:Colors.blue,
                                  child: Center(child: FittedBox(child: Text(onFictif[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)))
                              ),
                            ),
                            Positioned(
                              left:220,
                              top:170,
                              child: FittedBox(child: Text(onFictif[index].exchange, style: TextStyle(fontSize: 15),)),
                            ),

                          ],
                        );
                      }
                      else {
                        return Stack(
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child:  Image(image:AssetImage(imgList[index]),
                                    fit: BoxFit.cover,height: 200,width: 360,)
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 15,
                              child: Image(image: AssetImage(onFictif[index].imageBook),height: 170,),
                            ),
                            Positioned(
                                right: 50,
                                top: 15,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(onFictif[index].imageProfil),
                                  radius: 43,
                                )
                            ),
                            Positioned(
                              left:124,
                              top:100,
                              child: Container(
                                  height: 30,
                                  width: 190,
                                  // color:Colors.blue,
                                  child: Center(child: FittedBox(child: Text(onFictif[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)))
                              ),
                            ),
                            Positioned(
                              left:220,
                              top:170,
                              child: FittedBox(child: Text(onFictif[index].exchange, style: TextStyle(fontSize: 15),)),
                            ),

                          ],
                        );
                      }

                    },


                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        imgBook.length,
                            (index) => dotIndicator(index)
                    ),),
                  Divider(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('In Your City', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 213,
                      child: ListView.builder(
                          itemCount: name.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return CardsCont(imgBook: imgBook[index],
                              name: name[index],
                              title: title[index],
                              description: description[index],
                              avatar: avatar[index],
                            );
                          }
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Live Section',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: avatar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              SizedBox(width: 6),
                              CircleAvatar(
                                radius:50,
                                backgroundColor: Colors.redAccent,
                                child: CircleAvatar(
                                  // backgroundColor: Colors.redAccent,
                                  backgroundImage: AssetImage(avatar[index]),
                                  radius: 48,
                                ),
                              ),
                              SizedBox(width: 10,),
                            ],
                          );
                        }
                    ),
                  ),
                  Divider(),
                  // ElevatedButton(
                  //     onPressed: () {Provider.of<LoginController>(context, listen: false).logout();},
                  //     child: Text('logout')
                  // ),
                  Container(
                    color: Colors.grey,
                    height: 60,
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}

class CardsCont extends StatefulWidget {
  final String title;
  final String description;
  final String name;
  final String imgBook;
  final String avatar;
  const CardsCont({Key? key,
    required this.title,
    required this.description,
    required this.name,
    required this.imgBook,
    required this.avatar,
  }) : super(key: key);


  @override
  State<CardsCont> createState() => _CardsContState();
}

class _CardsContState extends State<CardsCont> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child:
      Row(
        children: [
          SizedBox(width: 5,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/raw4.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.5),
                          BlendMode.dstATop),
                    )
                ),
                child: Column(
                  children: [
                    AnimatedContainer(
                        width: selected ? 330.0 : 170.0,//**********
                        // width: selected1 ? 330
                        //     : selected2 ? 330
                        //     : selected3 ? 330
                        //     : selected4 ? 330
                        //     : 170,
                        height: 205.0,


                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 1,
                          //     blurRadius: 1,
                          //     offset: Offset(4, 8), // changes position of shadow
                          //   ),
                          // ],

                        // color: selected ? Colors.cyan : Colors.brown,
                        // alignment:selected ? Alignment.center : AlignmentDirectional.bottomCenter,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Stack(
                                children: [
                                  AnimatedContainer(
                                    // height: 110,
                                    // color: Colors.white,
                                    child: Column(
                                      children: [
                                        // Visibility(
                                        //   child: Text('la vie dartiste',),
                                        //   visible: selected,
                                        // ),
                                        Container(
                                          width: 95,
                                          child: Image(
                                            image: AssetImage(
                                                widget.imgBook),
                                            height: 115,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    alignment:selected//**********
                                        ? AlignmentDirectional
                                        .topStart
                                        : AlignmentDirectional
                                        .center,
                                    //   selected1 ? AlignmentDirectional.topStart
                                    // : selected2 ? AlignmentDirectional.topStart
                                    // : selected3 ? AlignmentDirectional.topStart
                                    // : selected4 ? AlignmentDirectional.topStart
                                    //       : AlignmentDirectional.center, //**********


                                    duration: const Duration(
                                        milliseconds: 500),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 23),
                                    child: Visibility(
                                      visible: selected,
                                      // fre == 0 ? true : false,//**********
                                      child: AnimatedContainer(
                                        // color: Colors.blue,
                                        alignment: AlignmentDirectional
                                            .centerEnd,
                                        // selected//**********
                                        //     ? AlignmentDirectional
                                        //     .centerEnd
                                        //     : AlignmentDirectional
                                        //     .topStart,
                                        duration: Duration(milliseconds: 800),
                                        child: FittedBox(
                                          child: AnimatedOpacity(
                                            child: Text(widget.description),
                                            opacity:selected ? 1: 0,
                                            // width == 330 ? 1 : 0,
                                            duration: Duration(milliseconds: 800),
                                            curve: Curves.slowMiddle,
                                          ),
                                        ),
                                      ),

                                      // const FlutterLogo(size: 50),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 134, left: 180),
                                    child: Visibility(
                                      visible: selected,//**********
                                      child: Image(image: AssetImage(
                                        'assets/star.png',),
                                        height: 65,),

                                      // const FlutterLogo(size: 50),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    height: 135,
                                    color: Colors.transparent,
                                    duration: Duration(milliseconds: 800),
                                    child: Text(widget.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'Yellowtail',
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    alignment: selected//**********
                                        ? AlignmentDirectional.topCenter
                                        : AlignmentDirectional
                                        .bottomCenter,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 145),
                                    child: AnimatedContainer(
                                      // color: Colors.red,
                                      duration: Duration(milliseconds: 800),
                                      alignment: selected//**********
                                          ? AlignmentDirectional
                                          .bottomStart
                                          : AlignmentDirectional
                                          .bottomStart,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets
                                                .only(left: 3.0),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  widget.avatar),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(widget.name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight
                                                    .bold),),
                                          SizedBox(width: 10,),

                                          // Visibility(
                                          //   visible: selected ,
                                          //   child: Image(image: AssetImage('assets/star.png',),height: 50,)
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
}

//
// class Ondialogue extends StatefulWidget {
//
//   @override
//   _OndialogueState createState() => _OndialogueState();
// }
//
// class _OndialogueState extends State<Ondialogue> {
//   int _currentStep = 0;
//   final double spacing = 8;
//   bool check = false;
//   bool isComplete = false;
//   String? value;
//   StepperType stepperType = StepperType.vertical;
//   final  ville = ['Agadir','Rabat', 'Marrakech', 'Fes', 'Chefchaouen', 'Essaouira', 'Casablanca', 'Tanger' ];
//
//   switchStepsType() {
//     setState(() => stepperType == StepperType.vertical
//         ? stepperType = StepperType.horizontal
//         : stepperType = StepperType.vertical);
//   }
//
//   tapped(int step){
//     setState(() => _currentStep = step);
//   }
//
//   continued(){
//     _currentStep < 2 ? setState(() => _currentStep += 1): null;
//   }
//   cancel(){
//     _currentStep > 0 ?
//     setState(() => _currentStep -= 1) : null;
//   }
//
//
//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       value: item,
//       child: Text(item, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),)
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: openDialog(),
//     );
//   }
//   openDialog()  async{
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) => AlertDialog(
//             insetPadding: EdgeInsets.symmetric(horizontal: 20),
//             title: Text('Steps to do'),
//             content: Stack(
//               children: [
//                 Container(
//                   height: 150,
//                   color:Colors.blue,
//                     child: Image.asset('assets/ebiblio2.png',fit: BoxFit.contain, height: 120,)
//                 ),
//                 Container(
//                   width: double.maxFinite,
//                   height: 350,
//                   child: MyDialog(),
//
//                   ),
//               ],
//             ))
//     );
//   }
// }





