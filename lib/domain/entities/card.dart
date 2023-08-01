part of 'entities.dart';

/// Card domain Entity.
abstract class CardEntity
    implements DomainEntity<CardEntity>, Built<CardEntity, CardEntityBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static void _setDefaults(CardEntityBuilder b) => b
    ..uuid.v = b.uuid.v ?? const Uuid().v4()
    ..createdOn.v = b.createdOn.v ?? DateTime.now().toUtc()
    ..updatedOn.v = b.updatedOn.v ?? DateTime.now().toUtc()
    ..revision.v = b.revision.v ?? 0;

  static Serializer<CardEntity> get serializer => _$cardEntitySerializer;

  factory CardEntity([void Function(CardEntityBuilder) updates]) = _$CardEntity;

  factory CardEntity.fake() => CardEntity((b) => b
    ..label = Label.fake().toBuilder()
    ..description = Description.fake().toBuilder()
    ..isDefault = IsDefaultFlag.fake().toBuilder()
    ..isActive = IsActiveFlag.fake().toBuilder()
    ..weight = Weight.fake().toBuilder()
    ..valueRange = IntRange.fake().toBuilder());

  Label get label;

  Description get description;

  IsDefaultFlag get isDefault;

  Weight get weight;

  IntRange get valueRange;

  IsActiveFlag get isActive;

  CardEntity._();

  @override
  IList<ValueObject<dynamic>> get constituents => IList<ValueObject<dynamic>>([
        label,
        description,
        isDefault,
        isActive,
        weight,
      ]);
}
