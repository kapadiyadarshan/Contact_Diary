import 'package:contact_diary/Controllers/Theme_Contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 0.3,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Text(
                  "Theme",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Consumer<ThemeController>(
                  builder: (context, provider, child) => ElevatedButton(
                    onPressed: () {
                      provider.changeTheme();
                    },
                    child: Text(provider.getTheme ? "Light" : "Dark"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
