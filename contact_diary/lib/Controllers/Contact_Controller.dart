import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/contact_modal.dart';

class ContactController extends ChangeNotifier {
  List<Contact> _allContacts = [];

  late SharedPreferences preferences;

  ContactController({required this.preferences});

  List<String> allFirstNames = [];
  List<String> allLastNames = [];
  List<String> allEmails = [];
  List<String> allContactNo = [];

  String sfFirstNames = "FirstNames";
  String sfLastNames = "LastNames";
  String sfEmails = "Emails";
  String sfContactNo = "ContactNo";

  init() {
    allFirstNames = preferences.getStringList(sfFirstNames) ?? [];
    allLastNames = preferences.getStringList(sfLastNames) ?? [];
    allEmails = preferences.getStringList(sfEmails) ?? [];
    allContactNo = preferences.getStringList(sfContactNo) ?? [];

    _allContacts = List.generate(
      allFirstNames.length,
      (index) => Contact(
        firstName: allFirstNames[index],
        lastName: allLastNames[index],
        email: allEmails[index],
        contcatNo: allContactNo[index],
      ),
    );
  }

  set() {
    preferences
      ..setStringList(sfFirstNames, allFirstNames)
      ..setStringList(sfLastNames, allLastNames)
      ..setStringList(sfEmails, allEmails)
      ..setStringList(sfContactNo, allContactNo);

    notifyListeners();
  }

  get getAllContactList {
    init();
    return _allContacts;
  }

  addContact({required Contact contact}) {
    init();
    if (!_allContacts.contains(contact)) {
      _allContacts.add(contact);

      allFirstNames.add(contact.firstName);
      allLastNames.add(contact.lastName!);
      allEmails.add(contact.email);
      allContactNo.add(contact.contcatNo);

      set();
    }
  }

  removeContact({required Contact contact, required int index}) {
    init();

    // int index = _allContacts.indexOf(contact);

    allFirstNames.removeAt(index);
    allLastNames.removeAt(index);
    allEmails.removeAt(index);
    allContactNo.removeAt(index);

    set();
  }

  editContact({required int index, required Contact contact}) {
    init();

    allFirstNames[index] = contact.firstName;
    allLastNames[index] = contact.lastName!;
    allEmails[index] = contact.email;
    allContactNo[index] = contact.contcatNo;

    set();
  }
}
