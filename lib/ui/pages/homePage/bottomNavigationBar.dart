import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulness.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionScreen.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulnessScreen.dart';
import 'package:flutter_app/ui/pages/homePage/sideMenu.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'addFriend.dart';
import 'unguidedMeditationPage.dart';

///Colloborates with the bottomnavigationbloc to navigate user to the page
///@Ece caliskan
///2021

class BottomNavigation extends StatefulWidget {
  createState() => _BottomNavigation();
  final String username;
  final UserRepository userRepository;

  BottomNavigation(
      {Key key, @required this.username, @required this.userRepository});
}

class _BottomNavigation extends State<BottomNavigation> {
  BottomNavBarBloc _bottomNavBarBloc;

  get name => this.name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF95B9D3),
        child: Icon(
            Icons.person_rounded,
                color: Colors.white,
        ),
        onPressed: () {  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                AddFriend(),
          ),
        );},

      ),
      appBar: AppBar(

        key: ValueKey("AppBar11"), //testing
        title: Text(
          'Feel',
          style: TextStyle(
            color: Color(0xFF8CADCA),
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF4F747D)),
      ),
      drawer: Drawer(  //creating a drawer element
        key: ValueKey("AppBar111"),//testing
        child: SideMenu(widget.username),
      ),

      body: StreamBuilder<NavBarItem>(
        key: ValueKey("navBar"), //testing
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) { //listens the stream and navigates user to the page
          switch (snapshot.data) {
            case NavBarItem.HOME:
              return HomePage();
            case NavBarItem.CHECKIN:
              return MindfulnessScreen();
            case NavBarItem.MEDITATION:
              return MeditationPage();
            case NavBarItem.JOURNALING:
              return SelfReflection(userRepository: widget.userRepository);
          }
          return Container();
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return BottomNavigationBar(  //creates the bottom navigation bar with the icons and texts
            key: ValueKey("bottomnavigation"),//testing
            backgroundColor: Colors.white,
            fixedColor: Color(0xFF95B9D3),
            unselectedItemColor: Colors.black54,
            currentIndex: snapshot.data.index,
            onTap: _bottomNavBarBloc.clickPage,//send the clicked page index to the bloc
            items: [
              BottomNavigationBarItem(
                title: Text('Home', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title:
                    Text('Mindfulness', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.article_rounded),
              ),
              BottomNavigationBarItem(
                title:
                    Text('Meditation', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.local_florist),
              ),
              BottomNavigationBarItem(
                title:
                    Text('Journaling', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.assignment_sharp),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() { //closes the bloc
    _bottomNavBarBloc.close();
    super.dispose();
  }

}
