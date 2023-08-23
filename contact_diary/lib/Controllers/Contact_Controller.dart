import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/contact_modal.dart';

class ContactController extends ChangeNotifier {
  List<Contact> _allContacts = [];

  List<String> _allContactsFirstName = [];
  List<String> _allContactsLastName = [];
  List<String> _allContactsEmail = [];
  List<String> _allContactsContactNo = [];

  late SharedPreferences preferences;

  ContactController({required this.preferences});

  get allContactList {
    return _allContacts;
  }

  get allContactFirstName {
    _allContactsFirstName = preferences.getStringList("firstName")!;
    return _allContactsFirstName;
  }

  get allContactLastName {
    _allContactsLastName = preferences.getStringList("lastName")!;
    return _allContactsLastName;
  }

  get allContactEmail {
    _allContactsEmail = preferences.getStringList("email")!;
    return _allContactsEmail;
  }

  get allContactContact {
    _allContactsContactNo = preferences.getStringList("contact")!;
    return _allContactsContactNo;
  }

  addContact({required Contact contact}) {
    if (!_allContacts.contains(contact)) {
      _allContacts.add(contact);
    }
    _allContactsFirstName.add(contact.firstName);
    _allContactsLastName.add(contact.lastName!);
    _allContactsEmail.add(contact.email);
    _allContactsContactNo.add(contact.contcatNo);

    preferences.setStringList("firstName", _allContactsFirstName);
    preferences.setStringList("lastName", _allContactsLastName);
    preferences.setStringList("email", _allContactsEmail);
    preferences.setStringList("contact", _allContactsContactNo);

    notifyListeners();
  }

  removeContact({required Contact contact}) {
    _allContacts.remove(contact);
    notifyListeners();
  }
}
