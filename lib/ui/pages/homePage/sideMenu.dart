import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/ui/authorize.dart';
import 'package:flutter_app/ui/pages/homePage/AppGuide.dart';
import 'package:flutter_app/ui/pages/homePage/privacy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class builds the sidemenu with sign-out functionality
//ece caliskan
//2021

class SideMenu extends StatelessWidget {
  final String name;

  SideMenu(this.name) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
              "Hello " + name,
              style: TextStyle(color: Colors.black),
            )),
            decoration: BoxDecoration(
              color: Color(0xFF95B9D3),
            ),
          ),
          ListTile(        // Sign out tile

            title: Text('Sign out'),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .dispatch(LoggedOut()); //signs the user out from the app//using the authentication bloc
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Authorize(
                            email: null,
                          )));
              return Authorize(
                email: null,
              );
            },
          ),
          ListTile(    // AppGuide tile
            // title: Text('App Guide'),
            title: Text('App Guide'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppGuide(),
                  )
              );
            },
          ),
          ListTile(    // AppGuide tile
            // title: Text('App Guide'),
            title: Text('Privacy Policy'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Privacy(),
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}
