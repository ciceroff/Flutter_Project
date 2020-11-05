import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'Requisicao/requisicao.dart';
import 'models/pedido_marmita.dart';

class PedidoBLoC {
  final _controller = StreamController<List<Marmita>>();
  Stream<List<Marmita>> get output => _controller.stream;
  Sink<List<Marmita>> get input => _controller.sink;
  PedidoBLoC(Requisicao requisicao) {
    requisicao.getList().listen(
      (event) {
        input.add(event);
      },
    );
  }
  dispose() {
    _controller.close();
  }

  create(String nome, String sabor, String tamanho, String fornecedor) async {
    await Requisicao().create(Marmita(nome, sabor, tamanho, fornecedor));
  }

  delete(Marmita marmita) {
    marmita.reference.delete();
  }
}
