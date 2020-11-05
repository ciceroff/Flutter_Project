import 'interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:Marmitas/models/pedido_marmita.dart';

class Requisicao extends Interface {
  static final _fb = FirebaseFirestore.instance;

  Stream<List<Marmita>> getList() {
    return _fb.collection('marmita').snapshots().map(
      (snap) {
        return snap.docs.map((it) => Marmita.fromMap(it)).toList();
      },
    );
  }

  Future<void> create(Marmita marmita) async {
    await _fb.collection('marmita').add(marmita.toMap());
  }
}
