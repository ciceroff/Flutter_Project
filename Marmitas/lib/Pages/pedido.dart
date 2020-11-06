import 'package:flutter/material.dart';
import 'package:Marmitas/Requisicao/requisicao.dart';
import 'package:Marmitas/bloc/pedido_bloc.dart';

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
    showAlertDialog(BuildContext context) {
      Widget okButton = FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("OK"),
      );
      AlertDialog alerta = AlertDialog(
        title: Text("Alerta"),
        content: Text(
            "Certifique-se de que todos os campos estão preenchidos corretamente"),
        actions: [
          okButton,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          });
    }

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
              hintText: "Exemplo: Strogonoff",
            ),
            controller: _controllerSabor,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tamanho: ',
              hintText: "Disponíveis: G, M, P",
            ),
            controller: _controllerTamanho,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Seu nome: ',
              hintText: "Exemplo: Carlos",
            ),
            controller: _controllerNome,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fornecedor: ',
              hintText: "Exemplo: O Belisco",
            ),
            controller: _controllerFornecedor,
          ),
          FlatButton(
            child: Text('Registrar pedido'),
            color: Colors.green[50],
            onPressed: () {
              if (_controllerFornecedor.text.isEmpty ||
                  _controllerNome.text.isEmpty ||
                  _controllerTamanho.text.isEmpty ||
                  _controllerSabor.text.isEmpty) {
                showAlertDialog(context);
              } else {
                switch (_controllerTamanho.text) {
                  case 'P':
                  case 'M':
                  case 'G':
                  case 'p':
                  case 'm':
                  case 'g':
                    Navigator.pop(context);
                    _bloc.create(_controllerNome.text, _controllerSabor.text,
                        _controllerTamanho.text, _controllerFornecedor.text);
                    break;
                  default:
                    showAlertDialog(context);
                }
              }
            },
          )
        ],
      ),
    );
  }
}
