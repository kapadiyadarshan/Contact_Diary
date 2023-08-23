import 'package:contact_diary/Controllers/Contact_Controller.dart';
import 'package:contact_diary/Modal/contact_modal.dart';
import 'package:contact_diary/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<ContactController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.allContactFirstName.length,
            itemBuilder: (context, index) {
              Contact contact = provider.allContactList[index];

              return Card(
                child: ListTile(
                  title: Text(
                      "${provider.allContactFirstName[index]} ${provider.allContactLastName[index]}"),
                  subtitle: Text(provider.allContactContact[index]),
                  leading: CircleAvatar(
                    backgroundColor: Colors
                        .primaries[index % Colors.primaries.length].shade500,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.AddContactPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
