import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OverlayWidget {
  OverlayEntry? _overlay;
  BuildContext context;
  OverlayState? _overlayState;
  OverlayWidget({required this.context}) {
    _overlayState = Overlay.of(context);
  }

  void show({required Widget widget}) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) =>
            ColoredBox(color: Colors.black.withOpacity(0.5), child: widget),
      );
      _overlayState!.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}

Widget LoadingWidget(
    double width, double height, OverlayWidget? overlayWidget) {
  return Container(
    width: width,
    height: height,
    color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Card(
        color: Colors.white.withOpacity(0.95),
        child: Container(
          width: width / 2,
          height: width / 2,
          color: Colors.transparent,
          child: Center(
            child: SpinKitFadingCircle(
              size: width / 4,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget ErrorWidget(BuildContext context, OverlayWidget overlayWidget,
    Function() Retry, String Error) {
  return Center(
    child: Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: Center(
                child: Column(
              children: [
                Text(
                  Error,
                  maxLines: 3,
                ),
                FilledButton(
                    onPressed: () {
                      overlayWidget.hide();
                      Retry();
                    },
                    child: Text("Retry"))
              ],
            )),
          ),
        ],
      ),
    ),
  );
}
