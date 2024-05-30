class Usuario {
  final String nome;
  final String email;
  final String senha;
  final List<String> exercicios;

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
    required this.exercicios,
  });
}