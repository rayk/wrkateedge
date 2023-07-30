part of 'types.dart';

/// A Extractor type is a [Reader] monad that produces an [EntityView] when it is
/// run with a [DomainEntity].
///
/// The intent behind this type is to allow the consumer the flexible to define
/// which values from a [DomainEntity] should be rendered.
typedef ValueExtractor = Reader<DomainEntity, EntityView>;
