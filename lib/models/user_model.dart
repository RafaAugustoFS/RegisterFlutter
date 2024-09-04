enum Gender {
  masculino,
  feminino
}
class UserModel {
  String nome;
  String email;
  int telefone;
  String endereco;
  Gender genero;

  UserModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.genero
  });
}