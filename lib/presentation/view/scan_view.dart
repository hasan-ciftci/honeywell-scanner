import 'package:flutter/material.dart';
import 'package:honeywell_scanner/honeywell_scanner.dart';
import 'package:honeywell_scanner/scanner_callback.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView>
    with WidgetsBindingObserver
    implements ScannerCallBack {
  HoneywellScanner honeywellScanner = HoneywellScanner();
  String scannedCode = 'Empty';
  bool scannerEnabled = false;
  bool scan1DFormats = true;
  bool scan2DFormats = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner.setScannerCallBack(this);
    updateScanProperties();
  }

  updateScanProperties() {
    List<CodeFormat> codeFormats = [];
    if (scan1DFormats) codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    if (scan2DFormats) codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);

//    codeFormats.add(CodeFormat.AZTEC);
//    codeFormats.add(CodeFormat.CODABAR);
//    codeFormats.add(CodeFormat.CODE_39);
//    codeFormats.add(CodeFormat.CODE_93);
//    codeFormats.add(CodeFormat.CODE_128);
//    codeFormats.add(CodeFormat.DATA_MATRIX);
//    codeFormats.add(CodeFormat.EAN_8);
//    codeFormats.add(CodeFormat.EAN_13);
////    codeFormats.add(CodeFormat.ITF);
//    codeFormats.add(CodeFormat.MAXICODE);
//    codeFormats.add(CodeFormat.PDF_417);
//    codeFormats.add(CodeFormat.QR_CODE);
//    codeFormats.add(CodeFormat.RSS_14);
//    codeFormats.add(CodeFormat.RSS_EXPANDED);
//    codeFormats.add(CodeFormat.UPC_A);
//    codeFormats.add(CodeFormat.UPC_E);
////    codeFormats.add(CodeFormat.UPC_EAN_EXTENSION);

    honeywellScanner
        .setProperties(CodeFormatUtils.getAsPropertiesComplement(codeFormats));
  }

  @override
  void onDecoded(String result) {
    setState(() {
      scannedCode = result;
    });
  }

  @override
  void onError(Exception error) {
    setState(() {
      scannedCode = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Honeywell scanner example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scanner: ${scannerEnabled ? "Started" : "Stopped"}',
              style:
                  TextStyle(color: scannerEnabled ? Colors.blue : Colors.red),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Text('Scanned code: $scannedCode'),
            Divider(
              color: Colors.transparent,
            ),
            SwitchListTile(
              title: Text("Scan 1D Codes"),
              subtitle: Text("like Code-128, Code-39, Code-93, etc"),
              value: scan1DFormats,
              onChanged: (value) {
                scan1DFormats = value;
                updateScanProperties();
                setState(() {});
              },
            ),
            SwitchListTile(
              title: Text("Scan 2D Codes"),
              subtitle: Text("like QR, Data Matrix, Aztec, etc"),
              value: scan2DFormats,
              onChanged: (value) {
                scan2DFormats = value;
                updateScanProperties();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: Text("Start Scanner"),
              onPressed: () {
                honeywellScanner.startScanner();
                scannerEnabled = true;
                setState(() {});
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            ElevatedButton(
              child: Text("Stop Scanner"),
              onPressed: () {
                honeywellScanner.stopScanner();
                scannerEnabled = false;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        honeywellScanner.resumeScanner();
        break;
      case AppLifecycleState.inactive:
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState
          .paused: //AppLifecycleState.paused is used as stopped state because deactivate() works more as a pause for lifecycle
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.detached:
        honeywellScanner.pauseScanner();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    honeywellScanner.stopScanner();
    super.dispose();
  }
}
