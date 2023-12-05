import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/infrastructure/isar/isar_database.dart';
import 'package:contacts/presentation/providers/isar/isar_provider.dart';
import 'package:contacts/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends ConsumerState<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _formData = {
    'name': '',
    'lastName': '',
    'phone': '',
    'avatarLink': '',
    'address': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Contacto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextInput(
                  label: 'Nombre*',
                  keyboardType: TextInputType.name,
                  validator: _nameValidator,
                  onChange: (value) {
                    _formData['name'] = value;
                  },
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Apellido*',
                  keyboardType: TextInputType.name,
                  validator: _nameValidator,
                  onChange: (value) {
                    _formData['lastName'] = value;
                  },
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Teléfono*',
                  keyboardType: TextInputType.phone,
                  validator: _phoneValidator,
                  onChange: (value) {
                    _formData['phone'] = value;
                  },
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Avatar Link',
                  keyboardType: TextInputType.text,
                  onChange: (value) {
                    _formData['avatarLink'] = value;
                  },
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Dirección',
                  keyboardType: TextInputType.text,
                  onChange: (value) {
                    _formData['address'] = value;
                  },
                ),
                const SizedBox(height: 32.0),
                FilledButton(
                  onPressed: () async{
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    final contact = Contact(
                      name: _formData['name']!,
                      lastName: _formData['lastName']!,
                      phone: _formData['phone']!,
                      avatar: _formData['avatarLink']!,
                      address: _formData['address'],
                    );
                    final isar = ref.read(isarProvider);
                    final navigator = Navigator.of(context);
                    await _saveContact(isar, contact);
                    navigator.pop();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Guardar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'El campo es obligatorio';
    }

    if (value.length < 3) {
      return 'Mínimo 3 caracteres';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'El campo es obligatorio';
    }

    if (value.length < 6) {
      return 'Mínimo 6 números';
    }

    return null;
  }

  Future<void> _saveContact(IsarDatabase isar, Contact contact) async {
    final db = await isar.db();

    await db.writeTxn(() async {
      await db.contacts.put(contact); // insert & update
    });
  }
}
