/*
 * Author: lin.zehong 
 * Date: 2020-07-17 23:11:00 
 * Desc: 扫描二维码和条形码  barcode_scan
 */
import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String barcode;

  Future _scan() async {
    try {
      // 可选参数配置
      final _flashOnController = TextEditingController(text: "打开闪关灯");
      final _flashOffController = TextEditingController(text: "关闭闪关灯");
      final _cancelController = TextEditingController(text: "取消");
      var _aspectTolerance = 0.00;
      var _useAutoFocus = true;
      var _autoEnableFlash = false;

      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      /// 普通用法
      // var result = await BarcodeScanner.scan();

      print(result.type); // The result type (barcode, cancelled, failed)
      print(result.rawContent); // The barcode content
      print(result.format); // The barcode format (as enum)
      print(result
          .formatNote); // If a unknown format was scanned this field contains a note

      // String barcode = (await BarcodeScanner.scan()) as String;
      setState(() {
        return this.barcode = result.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          return this.barcode = '用户没有授权摄像头权限！！！';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() => this.barcode = '扫描的二维码有问题。');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: _scan,
          child: Text('扫码'),
        ),
        Text("${barcode}")
      ],
    );
  }
}
