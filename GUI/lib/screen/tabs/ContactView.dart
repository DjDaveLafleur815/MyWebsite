// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _submitForm() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/contacts/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': _nameController.text,
        'firstname': _firstNameController.text,
        'email': _emailController.text,
        'message': _messageController.text,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Données transmises avec succès !')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors de la transmissions des données !')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactez-Moi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Entrez votre nom...',
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom !';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  hintText: 'Entrez votre prénom...',
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom !';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Adresse Mail',
                  hintText: 'Votre adresse mail',
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email !';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  hintText: 'Écrivez votre message ici...',
                  ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre message !';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
