import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationController!.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.withOpacity(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.lightGreenAccent,
                valueColor: animationController!.drive(ColorTween(
                    begin: Colors.brown,
                    end: Colors.green
                      )), //AlwaysStoppedAnimation(ColorManager.secondaryBlue),
                color: Colors.brown,
              ),
              // WidthSpacer(myWidth: 25.50),
              // Text(AppKeywords.loading),
            ],
          ),
        ),
      ],
    );
  }
}
