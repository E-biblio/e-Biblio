import 'package:flutter/material.dart';
import 'package:revivefrr/getStarted/data_getStarted.dart';
import 'package:revivefrr/pages/SecondHome.dart';
import 'package:revivefrr/pages/dialog.dart';
import 'package:revivefrr/pages/welcome.dart';
import 'package:revivefrr/style_key.dart';

import '../size_configs.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  _getStartedState createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 13,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/raw6.jpg'),
              fit: BoxFit.cover,
              // colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
            )),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value){
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: onboardingContents.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          SizedBox(height: sizeV * 5,),
                          Text(
                            onboardingContents[index].title,
                            style: kTitle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: sizeV * 5,),
                          Container(
                            height: sizeV * 50,
                            child: Image.asset(onboardingContents[index].image,fit: BoxFit.contain,),
                          ),
                          SizedBox(height: sizeV * 5,),
                          RichText(
                            textAlign: TextAlign.center,
                              text: TextSpan(
                                style: kBodyText1,
                                children: [
                                  TextSpan(text: onboardingContents[index].description)
                                  // TextSpan(text:'WE ARE HERE FOR '),
                                  // TextSpan(text:'YOUR PLEASURE ', style: TextStyle(color: kPrimaryColor)),
                                  // TextSpan(text:'TO BE BETTER '),
                                  // TextSpan(text:'VERSION OF YOU', style: TextStyle(color: kPrimaryColor)),
                                ]
                              )
                          ),
                          SizedBox(height: sizeV * 5,),

                        ],
                      )
                  )
              ),
              Expanded(
                flex: 1,
                  child: Column(
                    children: [
                      currentPage == onboardingContents.length -1?
                          MyButton(buttonName: 'Login',
                              onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHome()), (route) => false);
                              } ,
                              bgColor: Colors.brown):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(name: 'Skip', onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondHome(),),(route) => false);
                          }),
                          Row(
                            children: List.generate(
                                onboardingContents.length,
                                    (index) => dotIndicator(index)
                            ),
                          ),
                          OnBoardNavBtn(name: 'Next',
                              onPressed: () {
                            _pageController.nextPage(duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                              }),

                        ],
                      ),
                    ],
                  )
              )
            ],
          ),
        ),

      ),

    );
  }
}
class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({Key? key,required this.name,
  required this.onPressed,}) : super(key: key);
  final String name;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: kNextSkip,
        ),
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  const MyButton({Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor}) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(onPressed: onPressed, child: Text(buttonName,
          style: TextStyle(color: Colors.white,
              fontSize: SizeConfig.blockSizeH! * 4.5,
              fontWeight: FontWeight.bold),),style: TextButton.styleFrom(
            backgroundColor: bgColor),),
      ),
    );
  }
}


