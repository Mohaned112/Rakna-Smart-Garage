import '../../domain/entities/bookmark_entities.dart';

class BookMarkModel extends BookMark {
  const BookMarkModel(
      {required super.bookMarkId,
      required super.isBookMarked,
      required super.userForeignKey,
      required super.parkForeignKey,
      required super.park});

  factory BookMarkModel.fromJson(Map<String, dynamic> json) => BookMarkModel(
        bookMarkId: json['id'],
        isBookMarked: json['isFav'],
        userForeignKey: json['userForeignKey'],
        parkForeignKey: json['parkForeignKey'],
        park: json['park'],
      );
}
