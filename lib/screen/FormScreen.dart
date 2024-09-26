import 'package:flutter/material.dart';
import 'package:lista_usuarios/class/classUser.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.onSaved});

  final Function(User) onSaved;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerPrimerNom = TextEditingController();
  final TextEditingController _controllerSegundoNom = TextEditingController();
  final TextEditingController _controllerPrimerApe = TextEditingController();
  final TextEditingController _controllerSegundoApe = TextEditingController();
  final TextEditingController _controllerCorreo = TextEditingController();

  final List<User> users = [];

  String _primerNom = '';
  String _segundoNom = '';
  String _primerApe = '';
  String _segundoApe = '';
  String _correo = '';

  void _registrarUsuario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newUser = User(
          primerNombre: _primerNom,
          segundoNombre: _segundoNom,
          primerApellido: _primerApe,
          segundoApellido: _segundoApe,
          correo: _correo);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text(
            'Usuario registrado correctamente',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      widget.onSaved(newUser);

      _controllerPrimerNom.clear();
      _controllerSegundoNom.clear();
      _controllerPrimerApe.clear();
      _controllerSegundoApe.clear();
      _controllerCorreo.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar Usuario',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Primer Nombre',
                    border: OutlineInputBorder(),
                  ),
                  controller: _controllerPrimerNom,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, Informacion requerida';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _primerNom = newValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Segundo Nombre', border: OutlineInputBorder()),
                  controller: _controllerSegundoNom,
                  onSaved: (newValue) {
                    _segundoNom = newValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Primer Apellido',
                    border: OutlineInputBorder(),
                  ),
                  controller: _controllerPrimerApe,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, Informacion requerida';
                    }
                  },
                  onSaved: (newValue) {
                    _primerApe = newValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Segundo Apellido',
                    border: OutlineInputBorder(),
                  ),
                  controller: _controllerSegundoApe,
                  onSaved: (newValue) {
                    _segundoApe = newValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Correo',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerCorreo,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informacion requerida';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Por favor, ingresa un correo válido';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _correo = newValue!;
                  },
                ),
                const SizedBox( 
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: _registrarUsuario,
                    child: const Text('Registrar Usuario'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
