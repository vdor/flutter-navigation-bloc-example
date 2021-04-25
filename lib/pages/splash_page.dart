import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Text("Splash Screen",
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.white)),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    timer = Timer(Duration(seconds: 1), () {
      _goToWelcomePage(context);
    });
  }

  deactivate() {
    super.deactivate();
    timer?.cancel();
  }

  _goToWelcomePage(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterSetPathEvent(
        [WelcomePageConfig()],
      ),
    );
  }
}
