import 'package:flutter/material.dart';
import 'Requisicao/requisicao.dart';
import 'pedido_bloc.dart';

class Registra extends StatefulWidget {
  const Registra({
    Key key,
  }) : super(key: key);

  @override
  _RegistraState createState() => _RegistraState();
}

class _RegistraState extends State<Registra> {
  PedidoBLoC _bloc;
  @override
  Widget build(BuildContext context) {
    final _controllerSabor = TextEditingController();
    final _controllerNome = TextEditingController();
    final _controllerTamanho = TextEditingController();
    final _controllerFornecedor = TextEditingController();
    _bloc = PedidoBLoC(Requisicao());
    return Scaffold(
      appBar: AppBar(
        title: (Text("Registre seu pedido")),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Sabor: ',
            ),
            controller: _controllerSabor,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tamanho: ',
            ),
            controller: _controllerTamanho,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Seu nome: ',
            ),
            controller: _controllerNome,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fornecedor: ',
            ),
            controller: _controllerFornecedor,
          ),
          FlatButton(
            child: Text('Registrar pedido'),
            color: Colors.green[50],
            onPressed: () {
              Navigator.pop(context);
              _bloc.create(_controllerNome.text, _controllerSabor.text,
                  _controllerTamanho.text, _controllerFornecedor.text);
            },
          )
        ],
      ),
    );
  }
}
