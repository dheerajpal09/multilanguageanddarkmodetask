import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:wednesdaytask/provider/darkmodeprovider.dart';
import 'package:wednesdaytask/screens/language/multilangugae.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText("welcome"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Display Settings",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<DarkModeProvider>(
                  builder: (context, DarkModeProvider notifier, child) {
                return ListTile(
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: const Text("Experince on exciting dark mode"),
                  trailing: Switch(
                      value: notifier.isDark,
                      onChanged: (value) => notifier.changeTheme()),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Select Language",
                style: TextStyle(fontSize: 17),
              ),
              const MultiLanguage(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                accountName: Text(
                  "Dheeraj Pal",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("dheerajpalbmu@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: Center(
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "D",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ),
                  ),
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
