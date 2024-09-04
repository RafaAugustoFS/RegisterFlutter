import 'package:flutter/material.dart';
import 'package:project_register/models/user_model.dart';

class ShowUser extends StatelessWidget {
  const ShowUser({
    super.key,
    required this.users,
    });

    final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(users[0].nome),
            Text(users[0].email),
            Text(users[0].telefone.toString()),
            Text(users[0].endereco),
            Text(users[0].genero.name)
          ],
        ),
      ),
    );
  }
}