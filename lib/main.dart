import 'package:capstone_project/Screens/Cashout/cashout.dart';
import 'package:capstone_project/Screens/Homepage/homepage.dart';
import 'package:capstone_project/Screens/Kuota/kuota.dart';
import 'package:capstone_project/Screens/Login/login.dart';
import 'package:capstone_project/Screens/Pulsa/pulsa.dart';
import 'package:capstone_project/Screens/Register/register.dart';
import 'package:capstone_project/Screens/Topup/topup.dart';
import 'package:capstone_project/State/auth_provider.dart';
import 'package:capstone_project/State/cashout_state.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:capstone_project/State/kuota_provider.dart';
import 'package:capstone_project/State/operator_provider.dart';
import 'package:capstone_project/State/pembayaran_provider.dart';
import 'package:capstone_project/State/profile_provider.dart';
import 'package:capstone_project/State/pulsa_provider.dart';
import 'package:capstone_project/State/topup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileState(),
        ),
        ChangeNotifierProvider(
          create: (_) => TopupState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PulsaState(),
        ),
        ChangeNotifierProvider(
          create: (_) => OperatorState(),
        ),
        ChangeNotifierProvider(
          create: (_) => KuotaState(),
        ),
        ChangeNotifierProvider(
          create: (_) => CashoutState(),
        ),
      ],
      builder: (context, child) => Consumer<AuthState>(
        builder: (context, state, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/login': (_) => const LoginPage(),
            '/register': (_) => const ResgisterPage(),
            '/homepage': (_) => const HomePage(),
            '/topup': (_) => const TopupPage(),
            '/pulsa': (_) => const PulsaPage(),
            '/kuota': (_) => const KuotaPage(),
            '/cashout': (_) => const CashoutPage(),
          },
          home: state.isAuth
              ? const HomePage()
              : FutureBuilder(
                  future: state.autoLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return const LoginPage();
                  },
                ),
        ),
      ),
    );
  }
}
