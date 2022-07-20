import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class NativeBookApi {
  List<Book?> getNativeBookSearch(String keyword);

  void doMethodCall();
}