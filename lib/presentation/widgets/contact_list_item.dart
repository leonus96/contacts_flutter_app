import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/presentation/widgets/contact_avatar.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContactAvatar(contact: contact),
      title: Text('${contact.name} ${contact.lastName}'),
      subtitle: Text(contact.phone),
      onTap: () {
        Navigator.of(context).pushNamed('detail');
      },
    );
  }
}
