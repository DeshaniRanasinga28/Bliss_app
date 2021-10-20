import 'package:bliss/app/ui/screens/checkout/checkout_screen.dart';
import 'package:bliss/app/ui/screens/home/home_screen.dart';
import 'package:bliss/app/ui/screens/item/item_screen.dart';
import 'package:bliss/app/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/provider_config.dart';

void main() {
  runApp(Bliss());
}

class Bliss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bliss',
        routes: {
          '/homeScreen': (context) => HomeScreen(),
          '/checkoutScreen': (context) => CheckoutScreen(),
        },
        theme: ThemeData(
          // fontFamily: 'OpenSans',
          primaryColor: Colors.white,
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

