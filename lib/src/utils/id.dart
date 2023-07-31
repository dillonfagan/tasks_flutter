import 'package:uuid/uuid.dart';

class ID {
  static const _uuid = Uuid();
  static String create() => _uuid.v4();
}
