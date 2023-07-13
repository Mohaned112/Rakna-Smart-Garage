import 'package:equatable/equatable.dart';

class BookMark extends Equatable {
  final int bookMarkId;
  final bool isBookMarked;
  final int userForeignKey;
  final int parkForeignKey;
  final Map park;

  const BookMark({
    required this.bookMarkId,
    required this.isBookMarked,
    required this.userForeignKey,
    required this.parkForeignKey,
    required this.park,
  });

  @override
  List<Object> get props => [
        bookMarkId,
        isBookMarked,
        userForeignKey,
        parkForeignKey,
        park,
      ];
}
