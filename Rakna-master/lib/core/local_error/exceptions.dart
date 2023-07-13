import 'package:rakna/core/network/error_message_model.dart';

class LocalException implements Exception {
  final String statusMessage;
  final bool success;

  LocalException({required this.statusMessage, this.success = false});
}
