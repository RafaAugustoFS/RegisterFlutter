import 'package:flutter/material.dart';
import 'package:project_register/models/user_model.dart';
import 'package:project_register/view/show_user.dart';

class RegisterForm extends StatefulWidget { 
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  Gender _generoSelecionado = Gender.masculino;
  List<UserModel> users = [];

  void salvaInfo() {
    users.add(UserModel(
      nome: nameController.text,
      email: emailController.text,
      telefone: int.tryParse(phoneController.text) ?? 0,
      endereco: adressController.text,
      genero: _generoSelecionado,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Cadastro',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome:',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email:',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone:',
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: TextField(
              controller: adressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço: ',
              ),
            ),
          ),
          RadioListTile<Gender>(
            title: Text('Masculino'),
            value: Gender.masculino,
            groupValue: _generoSelecionado,
            onChanged: (Gender? value) {
              setState(() {
                _generoSelecionado = value!;
              });
            },
          ),
          RadioListTile<Gender>(
            title: Text('Feminino'),
            value: Gender.feminino,
            groupValue: _generoSelecionado,
            onChanged: (Gender? value) {
              setState(() {
                _generoSelecionado = value!;
              });
            },
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  salvaInfo();
                },
                child: Text("Salvar"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (users.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowUser(users: users),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nenhum usuário salvo")),
                    );
                  }
                },
                child: Text("Mostrar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 