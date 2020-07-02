import 'package:flutter/material.dart';
import 'package:food_app_course_resto/providers/user.dart';
import 'package:food_app_course_resto/screens/dashboard.dart';
import 'package:food_app_course_resto/screens/login.dart';
import 'package:food_app_course_resto/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
//        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
//        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
//        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
//        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return DashboardScreen();
      default:
        return LoginScreen();
    }
  }
}
