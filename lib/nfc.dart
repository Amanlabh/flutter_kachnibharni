import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class NFCPage extends StatefulWidget {
  @override
  _NFCPageState createState() => _NFCPageState();
}

class _NFCPageState extends State<NFCPage> {
  bool _isNFCEnabled = false;
  String _nfcResult = '';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? _qrViewController;

  @override
  void initState() {
    super.initState();
    checkNFC();
  }

  void checkNFC() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    setState(() {
      _isNFCEnabled = isAvailable;
    });

    if (isAvailable) {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        setState(() {
          _nfcResult = 'NFC Tag: ${tag.data}';
        });
      });
    }
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    NfcManager.instance.stopSession();
    super.dispose();
  }

  // QR Code View
  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _nfcResult = 'QR Code: ${scanData.code}';
      });
      controller.pauseCamera(); // Pause scanning after detecting a code
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan NFC or QR Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isNFCEnabled
              ? Text('NFC is available, bring a tag close to scan')
              : Text('NFC is not available on this device'),
          SizedBox(height: 16),
          Expanded(
            flex: 4,
            child: buildQRView(context), // QR Code scanner
          ),
          SizedBox(height: 16),
          Text(
            _nfcResult.isEmpty ? 'No data scanned yet' : _nfcResult,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
