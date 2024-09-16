import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chrome_extension.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyChromeSafariBrowser browser = MyChromeSafariBrowser();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Mirroring'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await browser.open(
              url: WebUri("https://app.tangoapp.dev"),
              settings: ChromeSafariBrowserSettings(
                // shareState: CustomTabsShareState.SHARE_STATE_ON, // Share option always enabled
                // barCollapsingEnabled: true,
                // enableUrlBarHiding: true,
                // showTitle: false,
                isTrustedWebActivity: true,
                //keepAliveEnabled: true, // Enable collapsing of toolbar when scrolling
              ),
            );
          },
          child: const Text("Open Chrome Browser"),
        ),
      ),
    );
  }
}
