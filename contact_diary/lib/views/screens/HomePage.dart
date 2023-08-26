import 'package:contact_diary/Controllers/Contact_Controller.dart';
import 'package:contact_diary/Modal/contact_modal.dart';
import 'package:contact_diary/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          PopupMenuButton(
            offset: const Offset(50, 50),
            onSelected: (value) async {
              if (value == MyRoutes.HiddenContactPage) {
                LocalAuthentication auth = LocalAuthentication();

                bool done = await auth.authenticate(
                    localizedReason: "Open to access hidden contacts !!");

                if (done) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Authentication done !!"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pushNamed(value);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Authentication failed !!"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                Navigator.pushNamed(context, value);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MyRoutes.SettingPage,
                child: const Text("Settings"),
              ),
              PopupMenuItem(
                value: MyRoutes.HiddenContactPage,
                child: const Text("Hidden Contact"),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<ContactController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.getAllContactList.length,
            itemBuilder: (context, index) {
              Contact contact = provider.getAllContactList[index];

              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MyRoutes.DetailPage, arguments: index);
                  },
                  title: Text(
                    "${contact.firstName} ${contact.lastName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(contact.contcatNo),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors
                        .primaries[index % Colors.primaries.length].shade500,
                    child: Text(
                      contact.firstName[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // provider.removeContact(contact: contact, index: index);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Are you sure delete ??",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "${contact.firstName} ${contact.lastName}\n",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: contact.contcatNo,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                provider.removeContact(
                                    contact: contact, index: index);

                                Navigator.pop(context);
                              },
                              child: const Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
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
