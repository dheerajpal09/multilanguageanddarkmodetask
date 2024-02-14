import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class MultiLanguage extends StatefulWidget {
  const MultiLanguage({super.key});

  @override
  State<MultiLanguage> createState() => _MultiLanguageState();
}

class _MultiLanguageState extends State<MultiLanguage> {
  List locales = [
    "English",
    "Iran",
    "Arbic",
  ];

  List localeCodes = [
    "en",
    "fa",
    "ar",
  ];

  int currentIndex = 0;
  bool selectedLocale = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: locales.length,
        itemBuilder: (context, index) {
          selectedLocale = currentIndex == index;
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                Locales.change(context, localeCodes[currentIndex]);
              },
              leading: Icon(
                selectedLocale ? Icons.check : Icons.language,
                color: Colors.white,
              ),
              title: Text(
                locales[index],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
