part of '../command.dart';

/// Command that targets as its subject  [CardEntityView] and toggles its
/// isActive flag from true to false or vice versa.
class ToggleActiveFlag extends CardCommand<CardEntityView> {
  final CardEntityView card;

  ToggleActiveFlag({
    required this.card,
  });

  @override
  String toString() => 'ToggleActiveFlag(card: $card)';
}
