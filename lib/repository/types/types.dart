/// Contains the external types that are exposed by the repositories to it
/// its consumers.
///
/// A. Consumer passes [RepoRequest] to the repo to request domain entities.
/// - [RepoRequest] contains a [Criterion] and a [ValueExtractor].
/// - [ValueExtractor] :: [DomainEntity] -> [EntityView]
library types;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/domain/domain.dart';

import '../../app/elements/view_values/view_values.dart';

part 'entity_view.dart';
part 'extractor.dart';
part 'records.dart';
