import 'package:app/agendar/ui/ui.dart';
import 'package:app/bindings/initBinding.dart';
import 'package:app/home/ui/ui.dart';
import 'package:app/solicitacoes/ui/ui.dart';
import 'package:app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Splash()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/agendar', page: () => AgendarScreen()),
        GetPage(name: '/solicitacoes', page: () => SolicitacoesScreen()),
      ],
      initialBinding: InitBindings(),
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
    );
  }
}
