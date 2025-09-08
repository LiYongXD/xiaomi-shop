import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    @required this.child,
    this.KeepAlive = true,
  }) : super(key: key);
  final Widget? child;
  final bool KeepAlive;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _keepAliveWrapperState();
  }
}

class _keepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child!;
  } 

  @override
  bool get wantKeepAlive => widget.KeepAlive;
}
