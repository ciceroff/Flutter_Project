import 'package:cloud_firestore/cloud_firestore.dart';

class Marmita {
  String nome;
  String sabor;
  String tamanho;
  String fornecedor;
  DocumentReference reference;
  Marmita(this.nome, this.sabor, this.tamanho, this.fornecedor);

  Marmita.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.nome = document.data()['Nome'];
    this.sabor = document.data()['Sabor'];
    this.tamanho = document.data()['Tamanho'];
    this.fornecedor = document.data()['Fornecedor'];
  }

  Map<String, dynamic> toMap() => {
        "Nome": nome,
        "Sabor": sabor,
        "Tamanho": tamanho,
        "Fornecedor": fornecedor
      };
}
