/// Contains the external types that are exposed by the repositories to it
/// its consumers.
///
/// A. Consumer passes [RepoRequest] to the repo to request domain entities.
/// - [RepoRequest] contains a [Criterion] and a [ValueExtractor].
/// - [ValueExtractor] :: [DomainEntity] -> [EntityView]
library types;

import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/domain/domain.dart';

part 'entity_view.dart';
part 'extractor.dart';
part 'records.dart';
