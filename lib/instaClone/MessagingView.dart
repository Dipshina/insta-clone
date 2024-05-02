import 'package:flutter/material.dart';
import 'package:my_application/MainProvider.dart';
import 'package:provider/provider.dart';

class MessagingView extends StatelessWidget {
  const MessagingView({super.key});

  @override
  Widget build(BuildContext context) {
        final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          Switch(
            value: ThemeMode.dark == mainProvider.themeMode,
            activeColor: mainProvider.themeMode == ThemeMode.dark
                ? Colors.white
                : Colors.black,
            onChanged: (bool value) {
              mainProvider.setThemeMode(
                mainProvider.themeMode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
    );
  }
}
