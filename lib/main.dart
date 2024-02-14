import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:wednesdaytask/provider/darkmodeprovider.dart';
import 'package:wednesdaytask/screens/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar', 'fa']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Settings ';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ChangeNotifierProvider(
        create: (BuildContext context) => DarkModeProvider()..init(),
        child: Consumer<DarkModeProvider>(
            builder: (context, DarkModeProvider notifier, child) {
          return LocaleBuilder(
            builder: (locale) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Multi Language',
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
              darkTheme:
                  notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
              home: MyHomePage(title: appTitle),
            ),
          );
        }),
      );
    }); // MaterialApp
  }
}
