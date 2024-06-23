// importations des Widgets de base de l'application
// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

// Classe de la page 'Contact'
class _ContactState extends State<Contact> {
  int currentIndex = 3;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HtmlEditorController _htmlController = HtmlEditorController();
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

@override
  void dispose() {
    // Libérer les contrôleurs lorsqu'ils ne sont plus nécessaires
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Envoyer le formulaire
      print('Message envoyé avec succès !');
      
      // Réinitialiser les contrôleurs pour effacer le formulaire
      nameController.clear();
      emailController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// En-tête de la page
      appBar: AppBar(
        title: const Text('Contactez-moi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
        ),
      ),
// Contenu de la page
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
// Champ 'Nom'
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nom :',
            hintText: 'Entrez votre nom',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez entrer votre nom !';
            }
            return null;
          },
        ),
// Champ 'Prénom'
      TextFormField(
        controller: firstNameController,
        decoration: const InputDecoration(
          labelText: 'Prénom :',
          hintText: 'Entrez votre prénom',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre prénom !';
          }
          return null;
        },
      ),
// Champ 'E-mail'
      TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          labelText: 'Adresse mail :',
          hintText: 'Entrez votre adresse mail',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre email !';
          }
          return null;
        },
      ),
// Champ 'Message'
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Votre message :',
                  hintText: 'Ecrivez votre message...',
                ),
              ),
// Bouton 'Envoyer'
      ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
    ));
  }
}
