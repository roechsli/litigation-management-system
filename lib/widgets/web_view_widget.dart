import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
// #docregion platform_imports

// #enddocregion platform_imports

class WebsiteViewer extends StatefulWidget {
  final String url;

  WebsiteViewer({required this.url});

  @override
  State<WebsiteViewer> createState() => _WebsiteViewerState();
}

class _WebsiteViewerState extends State<WebsiteViewer> {
  late final WebViewController _controller;
  late final PlatformWebViewControllerCreationParams params;

  @override
  void initState() {
    super.initState();

    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      //..setJavaScriptMode(JavaScriptMode.unrestricted)
      //..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
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
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      // ..addJavaScriptChannel(
      //   'Toaster',
      //   onMessageReceived: (JavaScriptMessage message) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(message.message)),
      //     );
      //   },
      // )
      ..loadRequest(
        Uri.parse(widget.url),
        headers: Map<String, String>(),
      );

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: WebViewWidget(controller: _controller),
    );
  }
}
