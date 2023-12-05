import 'package:contacts/domain/contact/contact.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  final Contact contact;
  final double? radius;

  const ContactAvatar({Key? key, required this.contact, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (contact.avatar == null) {
      double? fontSize;
      if(radius == null) {
        fontSize = 16;
      } else {
        fontSize = radius! / 1.5;
      }

      return CircleAvatar(
        radius: radius,
        child: Text(
          '${contact.name[0]}${contact.lastName[0]}',
          style: TextStyle(fontSize: fontSize),
        ),
      );
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(contact.avatar!),
      radius: radius,
    );
  }
}
