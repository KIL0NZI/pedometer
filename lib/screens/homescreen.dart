import 'package:flutter/material.dart';
import 'package:pedometer/Themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/models/bottom_nav_bar.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
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
                    Row(
                      children: [],
                    )
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
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(30.0), // Adjust the radius as needed
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
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
        backgroundColor: Colors.black,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: colors.home,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.analytics_rounded),
            title: Text('Leaderboard'),
            activeColor: colors.leaderboard,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.donut_large),
            title: Text('Analytics'),
            activeColor: colors.analytics,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: colors.settings,
          ),
        ],
      ),
    );
  }
}
