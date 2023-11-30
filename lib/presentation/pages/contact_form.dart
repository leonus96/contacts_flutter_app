import 'package:contacts/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  ContactForm({Key? key}) : super(key: key);

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
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Apellido*',
                  keyboardType: TextInputType.name,
                  validator: _nameValidator,
                ),
                const SizedBox(height: 8.0),
                TextInput(
                  label: 'Teléfono*',
                  keyboardType: TextInputType.phone,
                  validator: _phoneValidator,
                ),
                const SizedBox(height: 8.0),
                const TextInput(
                    label: 'Avatar Link', keyboardType: TextInputType.text),
                const SizedBox(height: 8.0),
                const TextInput(
                    label: 'Dirección', keyboardType: TextInputType.text),
                const SizedBox(height: 32.0),
                FilledButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text('Guardar'),
                        ),
                      ],
                    )),
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
}
