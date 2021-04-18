import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Settings",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(
                  onPressed: () {
                    _logout(context);
                  },
                  child: Text("Logout")),
            ],
          ),
        ));
  }

  _logout(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterSetPathEvent(
        [LoginPageConfig()],
      ),
    );
  }
}
