part of dartea;

typedef BusDispatch = void Function(Object msg);

class DarteaMessagesBus extends StatefulWidget {
  final Widget child;
  const DarteaMessagesBus({
    Key key,
    @required this.child,
  }) : super(key: key);

  static BusDispatch dispatchOf(BuildContext context) {
    final _MessagesBusInherited inherited =
        context.dependOnInheritedWidgetOfExactType<_MessagesBusInherited>();
    if (inherited == null) {
      return null;
    }
    return (msg) {
      if (!inherited.controller.isClosed) {
        inherited.controller.add(msg);
      }
    };
  }

  static Stream<Object> streamOf(BuildContext context) {
    final _MessagesBusInherited inherited =
        context.dependOnInheritedWidgetOfExactType<_MessagesBusInherited>();
    if (inherited == null) {
      return null;
    }
    return inherited.controller.stream;
  }

  @override
  _DarteaMessagesBusState createState() {
    return _DarteaMessagesBusState();
  }
}

class _DarteaMessagesBusState extends State<DarteaMessagesBus> {
  final _controller = StreamController<Object>.broadcast();

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return _MessagesBusInherited(controller: _controller, child: widget.child);
  }
}

class _MessagesBusInherited extends InheritedWidget {
  final StreamController<Object> controller;

  _MessagesBusInherited({this.controller, Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class OfExactTypeStreamTransformer<T> extends StreamTransformerBase<Object, T> {
  @override
  Stream<T> bind(Stream<Object> stream) {
    return stream.map<T>((obj) {
      if (obj is T) {
        return obj;
      }
      return null;
    });
  }
}
