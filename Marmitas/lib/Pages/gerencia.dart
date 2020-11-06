import 'package:Marmitas/models/pedido_marmita.dart';
import 'package:flutter/material.dart';
import 'package:Marmitas/Requisicao/requisicao.dart';
import 'package:Marmitas/bloc/pedido_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PedidoBLoC _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = PedidoBLoC(Requisicao());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marmitas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<List<Marmita>>(
        initialData: [],
        stream: _bloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Erro ${snapshot.error}");
          }
          if (snapshot.data.length == 0) {
            return Center(
              child: Text(
                "Nenhum pedido registrado até o momento",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[900],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext _, int index) {
              final item = snapshot.data[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green[900],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(7.5),
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _bloc.delete(item);
                    },
                    color: Colors.black,
                  ),
                  title: Text(item.nome),
                  subtitle: Text(item.sabor),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pedido');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
