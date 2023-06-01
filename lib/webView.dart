// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';




// class WebViewPage extends StatefulWidget {
//   final String url;

//   const WebViewPage({required this.url});

//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<WebViewPage> {
//   late WebViewController _controller;
//   bool _isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Web View'),
//       ),
      
//         body:  const SizedBox(
//           width: double.infinity,
//           // the most important part of this example
//           child: WebView(
//             initialUrl: 'https://www.kindacode.com/',
//             // Enable Javascript on WebView
//             javascriptMode: JavascriptMode.unrestricted,
//           )),
        
        
//         // WebView(
//         //     initialUrl: widget.url,
//         //     javascriptMode: JavascriptMode.unrestricted,
//         //     onWebViewCreated: (WebViewController controller) {
//         //       _controller = controller;
//         //     },
//         //     // onPageFinished: (String url) {
//         //     //   setState(() {
//         //     //     _isLoading = false;
//         //     //   });
//         //     // }, 
//         //   )
//         //   // if (_isLoading)
//         //   //   Center(
//         //   //     child: CircularProgressIndicator(),
//         //   //   ),
        
      
    
//   }
// }