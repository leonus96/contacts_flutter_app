import 'package:contacts/domain/contact/contact.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  final Contact contact;

  const ContactAvatar({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (contact.avatar == null) {
      return CircleAvatar(
          child: Text('${contact.name[0]}${contact.lastName[0]}'));
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(contact.avatar!),
    );
  }
}
