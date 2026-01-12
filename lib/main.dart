import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product/modules/loginscreen/login_screen.dart';
import 'package:product/modules/dashboard/dashboard_screen.dart';
import 'package:product/modules/auth/user_provider.dart';
import 'package:product/util_constant/size_config.dart';
import 'package:product/util_constant/color_constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barakah Bazar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      builder: (context, child) {
        return Builder(
          builder: (context) {
            SizeConfig().init(context);
            return child!;
          },
        );
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check login status on app start
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).checkLoginStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, auth, child) {
        if (auth.isAuthenticated) {
          return const DashboardScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
