import 'package:e_commerce_comic/cubit/url_payment/url_payment_cubit.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:e_commerce_comic/ui/payment/paymentfailed_screen.dart';
import 'package:e_commerce_comic/ui/payment/paymentsuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../cubit/navbarbutton/navbarbutton_cubit.dart';

class SnapWidget extends StatefulWidget {
  const SnapWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  State<SnapWidget> createState() => _SnapWidgetState();
}

class _SnapWidgetState extends State<SnapWidget> {
  WebViewController? _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {

            if (url.contains('status_code=202&transaction_status=deny')) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const PaymentFailedScreen();
              }));
            }
            if (url.contains('status_code=200&transaction_status=settlement') ||
                url.contains('phoneNumber=&pin=654321')) {
              context.read<UrlPaymentCubit>().deleteUrl(widget.url);
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const PaymentSuccessScreen();
              }));
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<NavbarbuttonCubit>().changeIndex(0);
            context.go(Routes.main);
          },
          icon: const Icon(
            Icons.home,
            size: 24.0,
          ),
        ),
        title: const Text('Snap Payment'),
        automaticallyImplyLeading: false,
      ),
      body: WebViewWidget(controller: _controller!),
    );
  }
}
