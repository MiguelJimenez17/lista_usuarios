import 'package:flutter/material.dart';
import 'package:lista_usuarios/class/classUser.dart';

class DataScreen extends StatefulWidget {
  const DataScreen(
      {super.key,
      required this.primerNom,
      required this.segundoNom,
      required this.primerApe,
      required this.segundoApe,
      required this.correo});

  final String primerNom;
  final String segundoNom;
  final String primerApe;
  final String segundoApe;
  final String correo;
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _controllerPrimerNom = TextEditingController();
  final TextEditingController _controllerSegundoNom = TextEditingController();
  final TextEditingController _controllerPrimerApe = TextEditingController();
  final TextEditingController _controllerSegundoApe = TextEditingController();
  final TextEditingController _controllerCorreo = TextEditingController();

  String newPrimerNom = '';
  String newSegundoNom = '';
  String newPrimerApe = '';
  String newSegundoApe = '';
  String newCorreo = '';

  @override
  void initState() {
    super.initState();
    _controllerPrimerNom.text = widget.primerNom;
    _controllerSegundoNom.text = widget.segundoNom;
    _controllerPrimerApe.text = widget.primerApe;
    _controllerSegundoApe.text = widget.segundoApe;
    _controllerCorreo.text = widget.correo;
  }

  void _validatorData() {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();

      newPrimerNom = newPrimerNom.isNotEmpty ? newPrimerNom : widget.primerNom;
      newSegundoNom =
          newSegundoNom.isNotEmpty ? newSegundoNom : widget.segundoNom;
      newPrimerApe = newPrimerApe.isNotEmpty ? newPrimerApe : widget.primerApe;
      newSegundoApe =
          newSegundoApe.isNotEmpty ? newSegundoApe : widget.segundoApe;
      newCorreo = newCorreo.isNotEmpty ? newCorreo : widget.correo;
    }

    Navigator.pop(
      context,
      {
        'primerNom': newPrimerNom,
        'SegundoNom': newSegundoNom,
        'primerApe': newPrimerApe,
        'segundoApe': newSegundoApe,
        'correo': newCorreo
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informacion de usuario',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Primer nombre',
                  border: OutlineInputBorder(),
                ),
                controller: _controllerPrimerNom,
                onChanged: (value) {
                  newPrimerNom = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Segundo nombre',
                  border: OutlineInputBorder(),
                ),
                controller: _controllerSegundoNom,
                onChanged: (value) {
                  newSegundoNom = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Primer apellido',
                  border: OutlineInputBorder(),
                ),
                controller: _controllerPrimerApe,
                onChanged: (value) {
                  newPrimerApe = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Segundo apellido',
                  border: OutlineInputBorder(),
                ),
                controller: _controllerSegundoApe,
                onChanged: (value) {
                  newPrimerApe = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informacion requerida';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
                controller: _controllerCorreo,
                onChanged: (value) {
                  newCorreo = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: _validatorData,
                  child: const Text('Actualizar registro'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
