import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:flutter_test/flutter_test.dart';


 
void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('Current User', () async {
    await store.getCurrentUser();
    expect(store.nameCurrentUser.isNotEmpty, true);

  });

  test('Teste Via Cep', () async {
    expect (await store.retornarInfosCep("39400139"), true);

  });
}