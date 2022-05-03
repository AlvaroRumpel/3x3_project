import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tres_x_tres_project/cadastro/view/cadastro_view.dart';
import 'package:tres_x_tres_project/home/view/home_view.dart';
import 'package:tres_x_tres_project/login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor primaryColor = MaterialColor(
    0xffee6730,
    <int, Color>{
      50: Color.fromARGB(10, 238, 103, 48),
      100: Color.fromARGB(20, 238, 103, 48),
      200: Color.fromARGB(30, 238, 103, 48),
      300: Color.fromARGB(40, 238, 103, 48),
      400: Color.fromARGB(50, 238, 103, 48),
      500: Color.fromARGB(60, 238, 103, 48),
      600: Color.fromARGB(70, 238, 103, 48),
      700: Color.fromARGB(80, 238, 103, 48),
      800: Color.fromARGB(90, 238, 103, 48),
      900: Color.fromARGB(100, 238, 103, 48),
    },
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '3x3 Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: const Color(0xff27201D),
      ),
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/singUp',
          page: () => CadastroView(),
        ),
      ],
    );
  }
}
