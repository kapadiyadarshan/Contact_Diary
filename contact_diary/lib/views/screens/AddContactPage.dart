import 'package:contact_diary/Controllers/Contact_Controller.dart';
import 'package:contact_diary/Modal/contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({super.key});

  @override
  RegExp emailRx = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  // const contactRx = /^\+?[1-9][0-9]{7,14}$/;

  GlobalKey<FormState> formKey = GlobalKey();

  String firstName = "";
  String lastName = "";
  String email = "";
  String contact = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create contact"),
        actions: [
          OutlinedButton(
            onPressed: () {
              bool isValidated = formKey.currentState!.validate();

              if (isValidated) {
                Contact con = Contact(
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                  contcatNo: contact,
                );

                Provider.of<ContactController>(context, listen: false)
                    .addContact(contact: con);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Contact save successfully.."),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );

                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text("Add Image"),
                ),
                const SizedBox(
                  height: 16,
                ),
                //First Name
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter First Name...";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text("First name"),
                    prefixIcon: Icon(
                      Icons.person_3_outlined,
                      size: 24,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    firstName = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Last Name
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Last Name...";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text("Last name"),
                    prefixIcon: Icon(
                      Icons.person_3_outlined,
                      size: 24,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    lastName = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Email
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter EmailAddress...";
                    } else if (!emailRx.hasMatch(value)) {
                      return "Please enter valid EmailAddress...";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text("Email Address"),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: 24,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Contact
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Contact Number...";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text("Contact Number"),
                    prefixIcon: Icon(
                      Icons.phone_android_outlined,
                      size: 24,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    contact = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
