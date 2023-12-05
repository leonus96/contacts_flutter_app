import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/presentation/widgets/contact_avatar.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final Function refresh;

  const ContactListItem({Key? key, required this.contact, required this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContactAvatar(contact: contact),
      title: Text('${contact.name} ${contact.lastName}'),
      subtitle: Text(contact.phone),
      onTap: () async {
        await Navigator.of(context).pushNamed('detail', arguments: contact);
        refresh();
      },
    );
  }
}
