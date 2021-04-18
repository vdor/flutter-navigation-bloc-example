import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Any password',
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: Text("Next")),
            ],
          ),
        ));
  }

  _login(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterSetPathEvent(
        [TasksPageConfig()],
      ),
    );
  }
}
