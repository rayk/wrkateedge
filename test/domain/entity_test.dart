@Tags(['unit'])
import 'package:flutter_test/flutter_test.dart';
import 'package:loggy/loggy.dart';
import 'package:wrkateedge/config/config.dart';
import 'package:wrkateedge/domain/entities/entities.dart';
import 'package:wrkateedge/domain/serializer/serializer.dart';

void main() {
  Loggy.initLoggy(
    logOptions: const LogOptions(LogLevel('test', ConfigValues.logLevel)),
  );

  group('Domain Entity:', () {
    test('Should return a fake Card Domain Entity.', () {
      final sut = CardEntity.fake();
      expect(sut, isA<CardEntity>());
    });

    test('Should automatically add identity information.', () {
      final sut = CardEntity.fake();
      expect(sut.uuid.value.isSome(), isTrue);
      expect(sut.createdOn.value.isSome(), isTrue);
      expect(sut.updatedOn.value.isSome(), isTrue);
      expect(sut.revision.value.isSome(), isTrue);
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

    test('Should Serialize to Map<String, Object>.', () {
      final result = serializers.serialize(CardEntity.fake());
      expect(result, isA<Map<String, Object>>());
    });

    test('Should Deserialize from Map<String, Object>.', () {
      final sut = CardEntity.fake();
      final serialized = serializers.serialize(sut);
      final result = serializers.deserialize(serialized);
      expect(result, sut);
    });
  });
}
