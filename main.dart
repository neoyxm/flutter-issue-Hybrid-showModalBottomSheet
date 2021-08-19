import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(new MaterialApp(
  title: 'Navigation Basics',
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  Native createState() => Native();
}
final String nativeViewType = 'view1';

Widget buildHybridCompositionView() {
  return PlatformViewLink(
    viewType: nativeViewType,
    surfaceFactory:
        (BuildContext context, PlatformViewController controller) {
      return  AndroidViewSurface(
        controller: (controller  as AndroidViewController),
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      );
    },
    onCreatePlatformView: (PlatformViewCreationParams params) {
      return PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: nativeViewType,
        layoutDirection: TextDirection.rtl,
        creationParams: {},
        creationParamsCodec: StandardMessageCodec(),
      )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
  );
}


class Native extends State<MyApp>{

  void _showActionSheet() {
    showModalBottomSheet(
        barrierColor: new Color.fromRGBO(1, 1, 1, 0.5),
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text("menu1"),
                ),
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text("menu2"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ElevatedButton(
            // onPressed: _isJoinChannelOk? onButtonLocalCamera : null,
              onPressed: _showActionSheet,
              child: new Text('showModalBottomSheet')),

         new Container(
              height: 100, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
              width: 100,
              child: buildHybridCompositionView(),
              // child: AndroidView(viewType: "view1",)
               ),
          new Container(
            height: 100, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
            width: 100,
            child: buildHybridCompositionView(),
            // child: AndroidView(viewType: "view1",)
          ),
          new Container(
            height: 100, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
            width: 100,
            child: buildHybridCompositionView(),
            // child: AndroidView(viewType: "view1",)
          ),
          new Container(
            height: 100, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
            width: 100,
            child: buildHybridCompositionView(),
            // child: AndroidView(viewType: "view1",)
          ),
        ],
      ),
      ),
    );
  }
}
