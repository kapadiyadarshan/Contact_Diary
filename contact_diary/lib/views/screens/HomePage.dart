import 'package:contact_diary/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.SettingPage);
            },
            icon: const Icon(
              CupertinoIcons.settings,
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("Darshan Kapadiya"),
                  subtitle: Text("8153801291"),
                  leading: CircleAvatar(),
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
