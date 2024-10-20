import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedometer/Themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/models/bottom_nav_bar.dart';
import 'package:pedometer/screens/leaderboard_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      MaterialPageRoute(builder: (BuildContext context) => const LeaderBoard());
    }
    if (index == 1) {
      MaterialPageRoute(builder: (BuildContext context) => const LeaderBoard());
    }
    if (index == 2) {
      MaterialPageRoute(builder: (BuildContext context) => const LeaderBoard());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 50,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Good Evening, Lucy',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ]),
              backgroundColor: colors.appbar,
              expandedHeight: 450.0,
              toolbarHeight: 150.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        colors.appbar,
                        Colors.black,
                        Colors.white,
                      ])),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(30.0), // Adjust the radius as needed
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      30.0), // Border radius for the collapsed state
                ),
              ),
            )
          ];
        },
        body: const Center(
          child: Text('Leaderboard'),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.analytics_rounded),
            title: Text('Leaderboard'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.donut_large),
            title: Text('Analytics'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: colors.activePage,
          ),
        ],
      ),
    );
  }
}
