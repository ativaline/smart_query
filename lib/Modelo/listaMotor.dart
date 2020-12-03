class ListaMotor {
  List<Lista> lista;

  ListaMotor({this.lista});

  ListaMotor.fromJson(Map<String, dynamic> json) {
    if (json['lista'] != null) {
      lista = new List<Lista>();
      json['lista'].forEach((v) {
        lista.add(new Lista.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lista != null) {
      data['lista'] = this.lista.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lista {
  int idArquivo;
  String nomeArquivo;
  String ipExecucao;
  int idExtracaoChamado;
  String email;
  int status;
  String dataCadastro;
  String dataFim;
  int idConfiguracao;
  String parametros;
  Null configuracoes;

  Lista(
      {this.idArquivo,
      this.nomeArquivo,
      this.ipExecucao,
      this.idExtracaoChamado,
      this.email,
      this.status,
      this.dataCadastro,
      this.dataFim,
      this.idConfiguracao,
      this.parametros,
      this.configuracoes});

  Lista.fromJson(Map<String, dynamic> json) {
    idArquivo = json['idArquivo'];
    nomeArquivo = json['nomeArquivo'];
    ipExecucao = json['ipExecucao'];
    idExtracaoChamado = json['idExtracaoChamado'];
    email = json['email'];
    status = json['status'];
    dataCadastro = json['dataCadastro'];
    dataFim = json['dataFim'];
    idConfiguracao = json['idConfiguracao'];
    parametros = json['parametros'];
    configuracoes = json['configuracoes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idArquivo'] = this.idArquivo;
    data['nomeArquivo'] = this.nomeArquivo;
    data['ipExecucao'] = this.ipExecucao;
    data['idExtracaoChamado'] = this.idExtracaoChamado;
    data['email'] = this.email;
    data['status'] = this.status;
    data['dataCadastro'] = this.dataCadastro;
    data['dataFim'] = this.dataFim;
    data['idConfiguracao'] = this.idConfiguracao;
    data['parametros'] = this.parametros;
    data['configuracoes'] = this.configuracoes;
    return data;
  }
}
