import 'package:flutter_test/flutter_test.dart';
import 'package:cadastro_usuario_web/app/modules/registration/registration_store.dart';
 
void main() {
  late RegistrationStore store;

  setUpAll(() {
    store = RegistrationStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}