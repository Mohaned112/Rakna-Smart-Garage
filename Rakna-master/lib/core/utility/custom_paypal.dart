library flutter_paypal;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http_auth/http_auth.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rakna/presentation/screens/payment_method.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../parking_timer_paypal.dart';
import '../../presentation/screens/parking_timer.dart';

class UsePaypal1 extends StatefulWidget {
  final Function onSuccess, onCancel, onError;
  final String returnURL, cancelURL, note, clientId, secretKey;
  final List transactions;
  final bool sandboxMode;
  final String parkSlotName;
  final int slotId;
  final int parkId;
  final int hourSelected;
  final String startDateFormat;
  final String endDateFormat;
  final String finalRandomNumber;
  final String randomNumber;
  final String parkName;
  final String parkLocation;
  final String reservationDate;
  final double latitude;
  final double longitude;
  final DateTime combinedEndDateFormat;
  final double priceAmount;
  final String  userName;
  final String  userPhoneNumber;
  final String  userEmail;
  final int  userId;
  const UsePaypal1({
    Key? key,
    required this.onSuccess,
    required this.onError,
    required this.onCancel,
    required this.returnURL,
    required this.cancelURL,
    required this.transactions,
    required this.clientId,
    required this.secretKey,
    this.sandboxMode = false,
    this.note = '',
    required this.parkSlotName,
    required this.slotId,
    required this.hourSelected, required this.startDateFormat, required this.endDateFormat, required this.finalRandomNumber, required this.parkId, required this.randomNumber, required this.parkName, required this.parkLocation, required this.reservationDate, required this.latitude, required this.longitude, required this.combinedEndDateFormat, required this.priceAmount, required this.userName, required this.userPhoneNumber, required this.userId, required this.userEmail,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UsePaypal1State();
  }
}

class UsePaypal1State extends State<UsePaypal1> {
  late final WebViewController _controller;
  String checkoutUrl = '';
  String navUrl = '';
  String executeUrl = '';
  String accessToken = '';
  bool loading = true;
  bool pageLoading = true;
  bool loadingError = false;
  late PaypalServices services;
  int pressed = 0;

  Map getOrderParams() {
    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": widget.transactions,
      "note_to_payer": widget.note,
      "redirect_urls": {
        "return_url": widget.returnURL,
        "cancel_url": widget.cancelURL
      }
    };
    return temp;
  }

  loadPayment() async {
    setState(() {
      loading = true;
    });
    try {
      Map getToken = await services.getAccessToken();
      if (getToken['token'] != null) {
        accessToken = getToken['token'];
        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        if (res["approvalUrl"] != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"].toString();
            navUrl = res["approvalUrl"].toString();
            executeUrl = res["executeUrl"].toString();
            loading = false;
            pageLoading = false;
            loadingError = false;
          });
          _controller.loadRequest(Uri.parse(checkoutUrl));
        } else {
          widget.onError(res);
          setState(() {
            loading = false;
            pageLoading = false;
            loadingError = true;
          });
        }
      } else {
        widget.onError("${getToken['message']}");

        setState(() {
          loading = false;
          pageLoading = false;
          loadingError = true;
        });
      }
    } catch (e) {
      widget.onError(e);
      setState(() {
        loading = false;
        pageLoading = false;
        loadingError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    services = PaypalServices(
      sandboxMode: widget.sandboxMode,
      clientId: widget.clientId,
      secretKey: widget.secretKey,
    );
    setState(() {
      navUrl = widget.sandboxMode
          ? 'https://api.sandbox.paypal.com'
          : 'https://www.api.paypal.com';
    });
    // Enable hybrid composition.
    loadPayment();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            setState(() {
              pageLoading = true;
              loadingError = false;
            });
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            setState(() {
              navUrl = url;
              pageLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
              code: ${error.errorCode}
              description: ${error.description}
              errorType: ${error.errorType}
              isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            if (request.url.contains(widget.returnURL)) {


              final currentContext = context;
              if (await ParkingRemoteDataSource().putReservationData(
                id: widget.slotId,
                parkingSlotName: widget.parkSlotName,
                startHour: widget.startDateFormat,
                endHour: widget.endDateFormat,
                isAvailable: false,
                randomNumber: widget.finalRandomNumber,
                parkForeignKey: widget.parkId,
              )&&
                  await ParkingRemoteDataSource().postParkSateApis(
                      parkName: widget.parkName,
                      location: widget.parkLocation,
                      parkState: 'ongoing',
                      userName: widget.userName,
                      parkCode: widget.finalRandomNumber,
                      startHour: widget.startDateFormat,
                      endHour: widget.endDateFormat,
                      userPhoneNumber: widget.userPhoneNumber,
                      parkSlotName: widget.parkSlotName,
                      parkPrice: widget.priceAmount,
                      reservationDuration: widget.hourSelected,
                      userForeignKey: widget.userId,
                      isCash: false, latitude: widget.latitude, longitude: widget.longitude, slotID: widget.slotId)) {
                ParkingRemoteDataSource().postPaypalData(userName: widget.userName, userEmail: widget.userEmail, startHour: widget.startDateFormat, userPhoneNumber: widget.userPhoneNumber, parkSlotName: widget.parkSlotName, parkPrice: widget.priceAmount, reservationDuration: widget.hourSelected, slotID: widget.slotId, userForeignKey: widget.userId, paymentMethod: 'Paypal', paymentStatus: 'completed');

                Future.delayed(Duration.zero, () {

                  Navigator.pushReplacement(
                    currentContext,
                    MaterialPageRoute(
                      // finalRandomNumber
                      builder: (context) => ParkingTimer(
                        parkSlotName: widget.parkSlotName,
                        hourSelected: widget.hourSelected,
                        slotId: widget.slotId,
                        // url: request.url,
                        // services: services,
                        // executeUrl: executeUrl,
                        // accessToken: accessToken,
                        // onSuccess: widget.onSuccess,
                        // onCancel: widget.onCancel,
                        // onError: widget.onError,
                        // finalRandomNumber: widget.finalRandomNumber,
                        startDateFormat: widget.startDateFormat,
                        endDateFormat: widget.endDateFormat,
                        randomNumber:widget.finalRandomNumber,
                        parkName: widget.parkName,
                        parkLocation: widget.parkLocation,
                        reservationDate: widget.reservationDate,
                        latitude: widget.latitude,
                        longitude: widget.longitude,
                        combinedEndDateFormat: widget.combinedEndDateFormat),
                    ),
                  );
                });
              } else {
                print('Error occurred. Please try again.');
                Future.delayed(
                    Duration.zero,
                        () => AwesomeDialog(
                      context: currentContext,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      headerAnimationLoop: false,
                      title: 'Error',
                      desc: 'Error occurred. Please try again.',
                      btnOkOnPress: () {},
                      btnOkIcon: Icons.cancel,
                      btnOkColor: Colors.red,
                    ).show());
                Future.delayed(const Duration(milliseconds: 1600),() => Navigator.pop(currentContext));
                Future.delayed(const Duration(milliseconds: 2000),() => Navigator.pop(currentContext));

              }

              // ParkingRemoteDataSource().putReservationData(
              //   id: widget.slotId,
              //   parkingSlotName: widget.parkSlotName,
              //   startHour: widget.startDateFormat,
              //   endHour: widget.endDateFormat,
              //   isAvailable: false,
              //   randomNumber: widget.finalRandomNumber,
              //   parkForeignKey: widget.parkId,
              // );
            }
            if (request.url.contains(widget.cancelURL)) {
              final uri = Uri.parse(request.url);
              await widget.onCancel(uri.queryParameters);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pressed < 2) {
          setState(() {
            pressed++;
          });
          final snackBar = SnackBar(
              content: Text(
                  'Press back ${3 - pressed} more times to cancel transaction'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF272727),
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () => Navigator.pop(context),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: Uri.parse(navUrl).hasScheme
                            ? Colors.green
                            : Colors.blue,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          navUrl,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(width: pageLoading ? 5 : 0),
                      pageLoading
                          ? const SpinKitFadingCube(
                              color: Color(0xFFEB920D),
                              size: 10.0,
                            )
                          : const SizedBox()
                    ],
                  ),
                ))
              ],
            ),
            elevation: 0,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: loading
                ? const Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: SpinKitFadingCube(
                            color: Color(0xFFEB920D),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  )
                : loadingError
                    ? Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: NetworkError(
                                  loadData: loadPayment,
                                  message: "Something went wrong,"),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: WebViewWidget(controller: _controller),
                          ),
                        ],
                      ),
          )),
    );
  }
}

// ignore_for_file: file_names

class PaypalServices {
  final String clientId, secretKey;
  final bool sandboxMode;

  PaypalServices({
    required this.clientId,
    required this.secretKey,
    required this.sandboxMode,
  });

  getAccessToken() async {
    String domain = sandboxMode
        ? "https://api.sandbox.paypal.com"
        : "https://api.paypal.com";
    try {
      var client = BasicAuthClient(clientId, secretKey);
      var response = await client.post(
          Uri.parse("$domain/v1/oauth2/token?grant_type=client_credentials"));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return {
          'error': false,
          'message': "Success",
          'token': body["access_token"]
        };
      } else {
        return {
          'error': true,
          'message': "Your PayPal credentials seems incorrect"
        };
      }
    } catch (e) {
      return {
        'error': true,
        'message': "Unable to proceed, check your internet connection."
      };
    }
  }

  Future<Map> createPaypalPayment(transactions, accessToken) async {
    String domain = sandboxMode
        ? "https://api.sandbox.paypal.com"
        : "https://api.paypal.com";
    try {
      var response = await http.post(Uri.parse("$domain/v1/payments/payment"),
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer $accessToken'
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return {};
      } else {
        return body;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer $accessToken'
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {'error': false, 'message': "Success", 'data': body};
      } else {
        return {
          'error': true,
          'message': "Payment inconclusive.",
          'data': body
        };
      }
    } catch (e) {
      return {'error': true, 'message': e, 'exception': true, 'data': null};
    }
  }
}

class NetworkError extends StatelessWidget {
  final Function loadData;
  final String message;
  final bool isSmall;

  const NetworkError(
      {super.key,
      required this.loadData,
      required this.message,
      this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/src/assets/img/cloud_state.png",
            package: "flutter_paypal",
            height: 120,
          ),
          SizedBox(
            height: isSmall ? 20 : 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF272727),
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => loadData(),
                child: const Text("Tap to retry",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
