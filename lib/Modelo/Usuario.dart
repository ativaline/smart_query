class LoginModelo {
  String nome;
  String imei;
  bool logado;
  String mensagem;
  String lojaUsuario;
  String lojasNaoPermitidas;
  String login;
  int idUsuario;

  LoginModelo(
      {this.nome,
      this.imei,
      this.logado,
      this.mensagem,
      this.lojaUsuario,
      this.lojasNaoPermitidas,
      this.login,
      this.idUsuario});

  LoginModelo.fromJson(Map<String, dynamic> json) {
    nome = json['Nome'];
    imei = json['Imei'];
    logado = json['Logado'];
    mensagem = json['Mensagem'];
    lojaUsuario = json['LojaUsuario'];
    lojasNaoPermitidas = json['LojasNaoPermitidas'];
    login = json['login'];
    idUsuario = json['IdUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = this.nome;
    data['Imei'] = this.imei;
    data['Logado'] = this.logado;
    data['Mensagem'] = this.mensagem;
    data['LojaUsuario'] = this.lojaUsuario;
    data['LojasNaoPermitidas'] = this.lojasNaoPermitidas;
    data['login'] = this.login;
    data['IdUsuario'] = this.idUsuario;
    return data;
  }
}
