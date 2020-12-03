class SmartqueryMotor {
  int idUsuario;
  int convenio;
  int produto;
  List<String> meioPagamento;
  List<String> ufEndereco;
  List<String> ufBeneficio;
  int loja;
  String idadeDe;
  String idadeAte;
  String salarioDe;
  String salarioAte;

  SmartqueryMotor(
      {this.idUsuario,
      this.convenio,
      this.produto,
      this.meioPagamento,
      this.ufEndereco,
      this.ufBeneficio,
      this.loja,
      this.idadeDe,
      this.idadeAte,
      this.salarioDe,
      this.salarioAte});

  SmartqueryMotor.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    convenio = json['convenio'];
    produto = json['produto'];
    meioPagamento = json['meioPagamento'].cast<String>();
    ufEndereco = json['ufEndereco'].cast<String>();
    ufBeneficio = json['ufBeneficio'].cast<String>();
    loja = json['loja'];
    idadeDe = json['idadeDe'];
    idadeAte = json['idadeAte'];
    salarioDe = json['salarioDe'];
    salarioAte = json['salarioAte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.idUsuario;
    data['convenio'] = this.convenio;
    data['produto'] = this.produto;
    data['meioPagamento'] = this.meioPagamento;
    data['ufEndereco'] = this.ufEndereco;
    data['ufBeneficio'] = this.ufBeneficio;
    data['loja'] = this.loja;
    data['idadeDe'] = this.idadeDe;
    data['idadeAte'] = this.idadeAte;
    data['salarioDe'] = this.salarioDe;
    data['salarioAte'] = this.salarioAte;
    return data;
  }
}
