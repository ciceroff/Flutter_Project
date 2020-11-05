import 'package:Marmitas/models/pedido_marmita.dart';

abstract class Interface {
  Stream<List<Marmita>> getList();
  Future<void> create(Marmita marmita);
}
