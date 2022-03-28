import 'package:calculadorafisica/generated/l10n.dart';
import 'package:calculadorafisica/providers/home_provider.dart';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// import 'converter/src/datos_persistentes/preferencias_usuario.dart';
import 'providers/converter_provider.dart';
import 'widgets_y_utilits/colors.dart';
import 'widgets_y_utilits/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // final prefs = new PreferenciasUsuario();
  // await prefs.initPrefs();
  runApp(MyApp());
}

// final prefs = new PreferenciasUsuario();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ConverterProvider()),
        ChangeNotifierProvider(create: (_) => TrigonometryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Unit Converter Googol',
        initialRoute: '/HomeScreen',
        routes: Routes.routes,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            brightness: Brightness.light,
            primaryColorBrightness: Brightness.dark,
            primaryColor: MyColors.blue9B,
            appBarTheme: AppBarTheme(brightness: Brightness.dark),
            textTheme: TextTheme(
                bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 222,
            ))),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
      ),
    );
  }
}
