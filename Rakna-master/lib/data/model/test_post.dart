import 'dart:convert';
import 'dart:io';

class ObjectResult<T> {
  final T value;
  int? statusCode;

  ObjectResult(this.value, {this.statusCode});

  Future<void> executeResult(HttpResponse response) async {
    response.statusCode = statusCode ?? HttpStatus.ok;
    response.headers.contentType = ContentType.json;
    response.write(jsonEncode(value));
    await response.close();
  }
}