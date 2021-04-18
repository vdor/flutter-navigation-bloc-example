import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Example of navigation2.0 connected to BLoC",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  _next(context);
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }

  _next(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        LoginPageConfig(),
      ),
    );
  }
}
