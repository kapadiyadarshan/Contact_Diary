import 'dart:io';

class Contact {
  String firstName, email, contcatNo;
  String? lastName = "";
  File? image;

  Contact({
    required this.firstName,
    this.lastName,
    required this.email,
    required this.contcatNo,
    this.image,
  });
}
