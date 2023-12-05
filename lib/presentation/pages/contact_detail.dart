import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/infrastructure/isar/isar_database.dart';
import 'package:contacts/presentation/providers/isar/isar_provider.dart';
import 'package:contacts/presentation/widgets/contact_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ContactDetail extends ConsumerWidget {
  const ContactDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final isar = ref.read(isarProvider);
                final navigator = Navigator.of(context);
                await _deleteContact(isar, contact);
                navigator.pop();
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                Share.share(
                  '''${contact.name} ${contact.lastName}
${contact.phone}'
${contact.address ?? 'S/D'}
                ''',
                  // subject: 'Contacts App',
                );
              },
              icon: const Icon(Icons.share)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactAvatar(
              contact: contact,
              radius: 48,
            ),
            const SizedBox(height: 16),
            Text(
              '${contact.name} ${contact.lastName}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 4.0),
            Text(
              contact.phone,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4.0),
            if (contact.address != null)
              Text(
                contact.address!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteContact(IsarDatabase isar, Contact contact) async {
    final db = await isar.db();
    await db.writeTxn(() async {
      await db.contacts.delete(contact.id); // delete
    });
  }
}
