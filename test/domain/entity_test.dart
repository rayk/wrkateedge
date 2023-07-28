import 'package:flutter_test/flutter_test.dart';
import 'package:wrkateedge/domain/entities/entities.dart';

void main() {
  group('Domain Entity:', () {
    test('Should return a fake Card Domain Entity.', () {
      final sut = CardEntity.fake();
      expect(sut, isA<CardEntity>());
    });

    test('Should not have any empty fields.', () {
      final sut = CardEntity.fake();

      expect(sut.label.value.isSome(), isTrue);
      expect(sut.description.value.isSome(), isTrue);
      expect(sut.isDefault.value.isSome(), isTrue);
      expect(sut.weight.value.isSome(), isTrue);
      expect(sut.valueRange.min.value.isSome(), isTrue);
      expect(sut.valueRange.max.value.isSome(), isTrue);
    });

    test('Should Serialised to int8.', () {});
  });
}
