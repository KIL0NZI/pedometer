import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedometer/Themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/models/bottom_nav_bar.dart';
import 'package:pedometer/models/pedometer_model.dart';
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

  void main() {
    Pedometer.pedestrianStatusStream.listen((PedestrianStatus status) {
      String steps = status.status;
      // print('Current status: ${status.status} at ${status.timeStamp}');
      // Use status.status wherever you need in your app
    });
  }

  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isExpanded ? 0.0 : 1.0, // Show title when collapsed
                  child: const Text('Collapsed Title'),
                ),

                // title: const Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.account_circle_outlined,
                //         size: 50,
                //       ),
                //       SizedBox(
                //         width: 12,
                //       ),
                //       Text(
                //         'You have walked 10,000 steps so far',
                //         style: TextStyle(color: Colors.white, fontSize: 20),
                //       ),
                //     ]),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.yellow.shade400,
                expandedHeight: 450.0,
                toolbarHeight: 150.0,
                floating: false,
                pinned: true,
                stretch: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  var appBarHeight = constraints.biggest.height;
                  _isExpanded = appBarHeight > 150;

                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                          _isExpanded ? 0.0 : 1.0, // Show title when collapsed
                      child: const Text('Collapsed Title'),
                    ),
                    collapseMode: CollapseMode.parallax,
                    background: Stack(children: [
                      if (_isExpanded)
                        const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ClipRRect(
                              //   borderRadius: BorderRadius.only(
                              //     bottomLeft: Radius.circular(
                              //         30.0), // Adjust the radius as needed
                              //     bottomRight: Radius.circular(30.0),
                              //   ),
                              // ),
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white),
                              ),
                              SizedBox(height: 30),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 30,
                                      value: .50,
                                      color: Colors.green,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('You have walked'),
                                  Text(''),
                                ],
                              )
                            ],
                          ),
                        )
                    ]),
                  );
                }),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                        30.0), // Border radius for the collapsed state
                  ),
                ),
              )
            ];
          },
          body: Container(
            decoration: const BoxDecoration(color: Colors.white),
          )),
      bottomNavigationBar: BottomNavyBar(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.analytics_rounded),
            title: const Text('Leaderboard'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.donut_large),
            title: const Text('Analytics'),
            activeColor: colors.activePage,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: colors.activePage,
          ),
        ],
      ),
    );
  }
}
