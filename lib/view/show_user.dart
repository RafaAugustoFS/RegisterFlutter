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
    if (users.isEmpty) {
      return Center(
        child: Text(
          'Nenhum usuário disponível',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
 
    // Usando ListView para renderizar múltiplos usuários, caso haja mais de um
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
       
        // Definir cor com base no gênero
        Color iconColor = user.genero.name == 'masculino' ? Colors.blue : Colors.pink;
 
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: iconColor, // Aplicando a cor baseada no gênero
                      size: 50,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome: ${user.nome}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Email: ${user.email}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Cellphone: ${user.telefone}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Endereço: ${user.endereco}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Gênero: ${user.genero.name}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
 