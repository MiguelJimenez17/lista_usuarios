import 'package:flutter/material.dart';
import 'package:lista_usuarios/class/classUser.dart';
import 'package:lista_usuarios/screen/DataScreen.dart';
import 'package:lista_usuarios/screen/FormScreen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<User> users = [];

  void _savedUser(User user) {
    setState(
      () {
        users.add(
          User(
              primerNombre: user.primerNombre,
              segundoNombre: user.segundoNombre,
              primerApellido: user.primerApellido,
              segundoApellido: user.segundoApellido,
              correo: user.correo),
        );
      },
    );
  }

  void _actualizarUser(int index, String newPrimerNom, String NewSegundoNom,
      String newPrimerApe, String NewSegundoApe, String newCorreo) {
    setState(
      () {
        users[index] = User(
            primerNombre: newPrimerNom,
            segundoNombre: NewSegundoNom,
            primerApellido: newPrimerApe,
            segundoApellido: NewSegundoApe,
            correo: newCorreo);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.blue,
            content: Text('Registro actualizado correctamente'),
          ),
        );
      },
    );
  }

  void _deleteUser(User user) {
    setState(
      () {
        users.remove(user);
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text('Registro eliminado'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Usuarios',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(
                onSaved: _savedUser,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return Card(
              elevation: 4,
              child: ListTile(
                leading: const FlutterLogo(),
                title: Text(user.primerNombre),
                trailing: IconButton(
                    onPressed: () {
                      _deleteUser(user);
                    },
                    icon: const Icon(Icons.delete)),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataScreen(
                        primerNom: user.primerNombre,
                        segundoNom: user.segundoNombre,
                        primerApe: user.primerApellido,
                        segundoApe: user.segundoApellido,
                        correo: user.correo,
                      ),
                    ),
                  );
                  if (result != null) {
                    _actualizarUser(
                        index,
                        result['primerNom'],
                        result['SegundoNom'],
                        result['primerApe'],
                        result['segundoApe'],
                        result['correo']);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
