import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_bloc_example/pages/login_page.dart';
import 'package:flutter_navigation_bloc_example/pages/settings_page.dart';
import 'package:flutter_navigation_bloc_example/pages/splash_page.dart';
import 'package:flutter_navigation_bloc_example/pages/task_details_page.dart';
import 'package:flutter_navigation_bloc_example/pages/tasks_page.dart';
import 'package:flutter_navigation_bloc_example/pages/welcome_page.dart';

import 'base.dart';

const splashPath = '/splash';
const welcomePath = '/welcome';
const loginPath = '/login';
const tasksPath = '/tasks';
const taskDetailPath = '/tasks-detail';
const settingsPath = '/settings';

class SplashPageConfig extends PageConfig {
  const SplashPageConfig({String key = 'Splash'}) : super(key: key);
  final String path = splashPath;

  @override
  Widget buildContent() {
    return SplashPage();
  }
}

class WelcomePageConfig extends PageConfig {
  const WelcomePageConfig({String key = 'Welcome'}) : super(key: key);
  final String path = welcomePath;

  @override
  Widget buildContent() {
    return WelcomePage();
  }
}

class LoginPageConfig extends PageConfig {
  const LoginPageConfig({String key = 'Login'}) : super(key: key);
  final String path = loginPath;

  @override
  Widget buildContent() {
    return LoginPage();
  }
}

class TasksPageConfig extends PageConfig {
  const TasksPageConfig({String key = 'Tasks'}) : super(key: key);
  final String path = tasksPath;

  @override
  Widget buildContent() {
    return TasksPage();
  }
}

class TaskDetailPageConfig extends PageConfig {
  final String path;

  const TaskDetailPageConfig({String key = 'TaskDetail', required this.path})
      : super(key: key);

  TaskDetailPageConfig.byTaskId(int id)
      : path = TaskDetailPageConfig.buildPathById(id),
        super(key: 'TaskDetail-$id');

  static String buildPathById(int id) => '$taskDetailPath/$id';

  int get id {
    return int.parse(path.split("/").last);
  }

  @override
  Widget buildContent() {
    return TaskDetailsPage(id);
  }
}

class SettingsConfig extends PageConfig {
  const SettingsConfig({String key = 'Settings'}) : super(key: key);
  final String path = settingsPath;

  @override
  Widget buildContent() {
    return SettingsPage();
  }
}
