import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rakna/data/model/parking_model.dart';
import 'package:rakna/data/model/parking_slot_model.dart';
import 'package:rakna/data/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/local_error/exceptions.dart';
import '../model/bookmark_model.dart';
import '../model/garage_owner_data_model.dart';
import '../model/garage_owner_parking_data_model.dart';
import '../model/park_state_model.dart';
import '../model/test_post.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();

  Stream<List<ParkingModel>> getParking1();

  Future<void> getBookMark(int userId);

  Future<List<GarageOwnerParkingModel>> getParkingGarageOwner(
      int garageOwnerId);

  Future<List<ParkingModel>> getSearchResult(String? query);

  Future<List<ParkingSlotModel>> getParkingSlot(int parkId);

  Stream<List<ParkingSlotModel>> getParkingSlot1(int parkId);

  Future<List<UserDataModel>> checkUserData();

  Future<List<UserDataModel>> getUserData(int userId);

  Future<List<GarageOwnerDataModel>> garageOwnerData(int garageOwnerId);

  Future<List<GarageOwnerDataModel>> checkGarageOwnerData();

  Future<List<ParkStateModel>> parkSateApis(
      {required int userId, required String state});

  void putUserData({
    required int userID,
    required String userName,
    required String phoneNumber,
    required String password,
    required String email,
    required int age,
    required String userImage,
  });

  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });

  void postPark(
      {required String parkName,
      required String parkLocation,
      required String parkImage,
      required double parkPrice,
      required double latitude,
      required double longitude,
      required int garageOwnerId});

  void postParkSateApis({
    required String parkName,
    required String location,
    required String parkState,
    required String userName,
    required String parkCode,
    required String startHour,
    required String endHour,
    required String userPhoneNumber,
    required String parkSlotName,
    required double parkPrice,
    required double latitude,
    required double longitude,
    required int reservationDuration,
    required int slotID,
    required int userForeignKey,
    required bool isCash,
  });

  void putPark(
      {required int parkId,
      required String parkName,
      required String parkLocation,
      required String parkImage,
      required double parkPrice,
      required double latitude,
      required double longitude,
      required double parkRating,
      required int garageOwnerId});

  void putReservationData({
    required int id,
    required String parkingSlotName,
    required String startHour,
    required String endHour,
    required bool isAvailable,
    required String randomNumber,
    required int parkForeignKey,
  });

  void postReservationData(
      {required String parkingSlotName, required int parkForeignKey});

  void putBookMarks({
    required bool isFavorite,
    required int userId,
    required int parkId,
  });

  void putBookMark({
    required bool isFavorite,
    required int userId,
    required int parkId,
  });

  void deleteReservationData({required int parkSlotId});

  void deleteBookMark({required int bookMarkId});
}

class ParkingRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ParkingModel>> getParking() async {
    final Response response =
        await Dio().get('http://minagamil123-001-site1.ctempurl.com/Parks');
    print('${response.statusCode}');
    // print('${response.data}');
    if (response.statusCode == 200) {
      return List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Stream<List<ParkingModel>> getParking1() async* {
    final Response response =
        await Dio().get('http://minagamil123-001-site1.ctempurl.com/Parks');
    print('${response.statusCode}');
    // print('${response.data}');
    if (response.statusCode == 200) {
      yield List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<ParkingSlotModel>> getParkingSlot(int parkId) async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/ParkingSlot/$parkId'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingSlotModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<UserDataModel>> checkUserData() async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/Register'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      return List<UserDataModel>.from(
          (response.data as List).map((e) => UserDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<bool> postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    var body = jsonEncode({
      "userName": userName,
      'phoneNumber': phoneNumber,
      'password': password,
      'email': email,
      "age": age.toString(),
      'confirmPassword': confirmPassword,
      'userImage': 'strin',
    });

    try {
      http.Response response = await http.post(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Register'),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }

  @override
  Future<bool> putReservationData({
    required int id,
    required String parkingSlotName,
    required String startHour,
    required String endHour,
    required bool isAvailable,
    required String randomNumber,
    required int parkForeignKey,
  }) async {
    var body = {
      'id': id,
      'parkingSlotName': parkingSlotName,
      'startHour': startHour,
      'endHour': endHour,
      'isAvailable': isAvailable,
      'randomNumber': randomNumber,
      'parkForeignKey': parkForeignKey,
    };

    try {
      http.Response response = await http.put(
        Uri.parse('http://minagamil123-001-site1.ctempurl.com/ParkingSlot/$id'),
        body: jsonEncode(body),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }

  @override
  Future<List<ParkingModel>> getSearchResult(String? query) async {
    final Response response =
        await Dio().get('http://minagamil123-001-site1.ctempurl.com/Parks');
    if (response.statusCode == 200) {
      var result = List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));

      if (query != null) {
        var x = result
            .where((element) =>
                element.parkName.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return x;
      } else {
        return result;
      }
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<GarageOwnerDataModel>> checkGarageOwnerData() async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/GarageOwner'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      print('${response.data}');
      return List<GarageOwnerDataModel>.from(
          (response.data as List).map((e) => GarageOwnerDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<GarageOwnerParkingModel>> getParkingGarageOwner(
      int garageOwnerId) async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/GarageOwner/$garageOwnerId');
    print('${response.statusCode}');
    print('${response.data}');
    if (response.statusCode == 200) {
      return List<GarageOwnerParkingModel>.from((response.data as List)
          .map((e) => GarageOwnerParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<bool> postPark(
      {required String parkName,
      required String parkLocation,
      required double parkPrice,
      required double latitude,
      required double longitude,
      required int garageOwnerId,
      required String parkImage}) async {
    var body = {
      "parkName": parkName,
      "parkLocation": parkLocation,
      "parkImage": parkImage,
      'parkPrice': parkPrice,
      'latitude': latitude.toDouble(),
      'longitude': longitude.toDouble(),
      'garageForeignKey': garageOwnerId,
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Parks'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }

  @override
  void postReservationData(
      {required String parkingSlotName, required int parkForeignKey}) async {
    var body = {
      "id": 0,
      "parkingSlotName": parkingSlotName,
      "startHour": '2023-06-14 18:33',
      'endHour': '2023-06-14 18:33',
      'isAvailable': true,
      "numberOfSlots": 1,
      "numberOfSections": 1,
      'randomNumber': '1231',
      'parkForeignKey': parkForeignKey,
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/ParkingSlot'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  void deleteReservationData({required int parkSlotId}) async {
    try {
      http.Response response = await http.delete(
          Uri.parse(
              'http://minagamil123-001-site1.ctempurl.com/ParkingSlot/$parkSlotId'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  Future<bool> putPark(
      {required int parkId,
      required String parkName,
      required String parkLocation,
      required String parkImage,
      required double parkPrice,
      required double latitude,
      required double longitude,
      required double parkRating,
      required int garageOwnerId}) async {
    var body = {
      "parkId": parkId,
      "parkName": parkName,
      "parkLocation": parkLocation,
      "parkImage": parkImage,
      'parkPrice': parkPrice,
      "parkingRating": parkRating,
      "parkSection": 0,
      "reservationPlace": 0,
      "latitude": latitude,
      "longitude": longitude,
      'garageForeignKey': garageOwnerId,
    };

    try {
      http.Response response = await http.put(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Parks/$parkId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }

  @override
  Stream<List<ParkingSlotModel>> getParkingSlot1(int parkId) async* {
    final Response response = await Dio()
        .get('http://minagamil123-001-site1.ctempurl.com/ParkingSlot/$parkId');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      yield List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingSlotModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<BookMarkModel>> getBookMark(int userId) async {
    final Response response = await Dio()
        .get('http://minagamil123-001-site1.ctempurl.com/BookMark/user/$userId');
    print('${response.statusCode} bookmark');
    // print('${response.body}');
    if (response.statusCode == 200) {
      return List<BookMarkModel>.from(
          (response.data as List).map((e) => BookMarkModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  void putBookMarks(
      {
      required bool isFavorite,
        required int userId,
         int bookMarkId = 0,
      required int parkId}) async {
    var body = {

      "isFav": isFavorite,
      "userForeignKey": userId,
      "parkForeignKey": parkId,
    };

    try {
      http.Response response = await http.put(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/BookMark/$bookMarkId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  void putBookMark(
      {required bool isFavorite, required int userId, required int parkId}) {
    // TODO: implement putBookMark
  }

  @override
  Future<void> putUserData(
      {required int userID,
      required String userName,
      required String phoneNumber,
      required String password,
      required String email,
      required int age,
      required String userImage}) async {
    var body = {
      "userName": userName,
      "userID": userID,
      "phoneNumber": phoneNumber,
      "password": password,
      "email": email,
      "age": age,
      "confirmPassword": password,
      "userImage": userImage,
    };

    try {
      http.Response response = await http.put(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Register/$userID'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  Future<List<UserDataModel>> getUserData(int userId) async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/Register/$userId'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      return List<UserDataModel>.from(
          (response.data as List).map((e) => UserDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<GarageOwnerDataModel>> garageOwnerData(int garageOwnerId) async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/GarageOwner/$garageOwnerId'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      return List<GarageOwnerDataModel>.from(
          (response.data as List).map((e) => GarageOwnerDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  void deleteBookMark({required int bookMarkId}) async {
    try {
      http.Response response = await http.delete(
          Uri.parse(
              'http://minagamil123-001-site1.ctempurl.com/BookMark/$bookMarkId'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  Future<List<ParkStateModel>> parkSateApis(
      {required int userId, required String state}) async {
    final Response response = await Dio().get(
        'http://minagamil123-001-site1.ctempurl.com/ParkSateApis/$userId/$state'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      return List<ParkStateModel>.from(
          (response.data as List).map((e) => ParkStateModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<bool> postParkSateApis({
    required String parkName,
    required String location,
    required String parkState,
    required String userName,
    required String parkCode,
    required String startHour,
    required String endHour,
    required String userPhoneNumber,
    required String parkSlotName,
    required double parkPrice,
    required double latitude,
    required double longitude,
    required int reservationDuration,
    required int slotID,
    required int userForeignKey,
    required bool isCash,
  }) async {
    var body = {
      "id": 0,
      "parkName": parkName,
      "location": location,
      "parkPrice": parkPrice.toDouble(),
      "parkState": parkState,
      "isCash": isCash,
      "userName": userName,
      "parkCode": parkCode,
      "reservationDuration": reservationDuration,
      "startHour": startHour,
      "endHour": endHour,
      "userPhoneNumber": userPhoneNumber,
      "parkSlotName": parkSlotName,
      "latitude": latitude,
      "longitude": longitude,
      "slotID": slotID,
      "endDateFormat": endHour,
      "userForeignKey": userForeignKey
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/ParkSateApis'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  } Future<bool> postPaypalData({

    required String userName,
    required String userEmail,
    required String startHour,
    required String userPhoneNumber,
    required String parkSlotName,
    required double parkPrice,
    required int reservationDuration,
    required int slotID,
    required int userForeignKey,
    required String paymentMethod,
    required String paymentStatus,
  }) async {
    var rng = Random();

    var body = {
      "phoneNumber": userPhoneNumber,
      "payPalId": 0,
      "userName": userName,  ///
      "email": userEmail,  ///
      "productName": parkSlotName,  ///
      "productPrice": parkPrice,
      "paymentMethod": paymentMethod,  ///
      "paymentStatus": paymentStatus,  ///
      "purchaseDate": startHour,  ///
      "amountPaid": parkPrice,     ///
      "receiptNumber": rng.nextInt(10000)  ///
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/api/PayPalAPI'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }



  Future<bool> patchUserData({required int userId, required String userImage}) async {
    var body = [
      { "op": "replace", "path": "/userImage", "value": userImage },
    ];

    try {
      http.Response response = await http.patch(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Register/$userId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }
  Future<bool> patchGarageOwnerData({required int garageOwnerId, required String garageOwnerImage}) async {
    var body = [
      { "op": "replace", "path": "/garageOwnerImage", "value": garageOwnerImage },
    ];

    try {
      http.Response response = await http.patch(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/GarageOwner/$garageOwnerId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }
  Future<bool> patchParkState({required int parkStateId, required String parkState}) async {
    var body = [
      { "op": "replace", "path": "/parkState", "value": parkState },
    ];

    try {
      http.Response response = await http.patch(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/ParkSateApis/$parkStateId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }
  Future<bool> patchPark({required int parkId, required double amount}) async {
    var body = [
      { "op": "add", "path": "/amount", "value": amount },
    ];

    try {
      http.Response response = await http.patch(
          Uri.parse('http://minagamil123-001-site1.ctempurl.com/Parks/$parkId'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      if (response.statusCode == 500) {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode} g500');
        return false; // Return false to indicate failure
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful, no response body expected
        print('Reservation data updated successfully!');
        return true; // Return true to indicate success
      } else {
        print('Failed to update reservation data!');
        print('Response status code: ${response.statusCode}');
        return false; // Return false to indicate failure
      }
    } catch (e) {
      print('Error catch occurred while updating reservation data: $e');
      return false; // Return false to indicate failure
    }
  }

}
