import 'package:crypdo/src/commons/utils/mockNetwork/src/matchers/matcher.dart';

/// Subclass of [Matcher] that always returns true when calling [matches].
class AnyMatcher extends Matcher {
  const AnyMatcher();

  @override
  bool matches(dynamic actual) => true;

  @override
  String toString() => 'AnyMatcher {}';
}
