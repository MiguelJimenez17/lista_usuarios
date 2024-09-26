class User {
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String correo;

  User(
      {required this.primerNombre,
      this.segundoNombre = '',
      required this.primerApellido,
      this.segundoApellido = '',
      required this.correo});
}
