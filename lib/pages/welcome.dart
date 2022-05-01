import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:revivefrr/pages_slider/books.dart';
import 'package:revivefrr/pages_slider/livres.dart';
import 'package:revivefrr/pages_slider/romans.dart';


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

Future<bool?> showWarning(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Warning!"),
      content: Text("Do you want to logout?!"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true), child: Text("Yes")),
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

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = [
      const Livres(),
      const Romans(),
      const ProductInfo(),
    ];
    final _kTabs = [
      const Tab(text: 'Livres'),
      const Tab(text: 'Romans'),
      const Tab(text: 'Books'),
    ];
    int _currentIndex = 0;
    // int _counter = 1;

    // void _incrementCounter() {
    //   setState(() {
    //     _counter++;
    //   });
    // }

    return DefaultTabController(
      length: _kTabs.length,
      child: WillPopScope(
        onWillPop: () async{
      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    },
    child:Scaffold(
        appBar: AppBar(
          title: const Text(
            'welcome',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 1.0),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  LineAwesomeIcons.search,
                  color: Colors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  LineAwesomeIcons.bars,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: TabBar(
            tabs: _kTabs,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
        bottomNavigationBar: BottomNavyBar(
          // containerHeight: 60,
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.brown,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.people),
              title: const Text('Users'),
              activeColor: Colors.brown,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.message),
              title: const Text(
                'Messages',
              ),
              activeColor: Colors.brown,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.brown,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
  }

}
