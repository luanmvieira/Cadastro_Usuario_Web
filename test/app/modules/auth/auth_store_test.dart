import 'package:flutter_test/flutter_test.dart';
import 'package:cadastro_usuario_web/app/modules/auth/store/auth_store.dart';
 
void main() {
  late AuthStore store;

  setUpAll(() {
    store = AuthStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}