part of cached_query_flutter;

// todo(Dan): add examples to docs.
/// {@template infiniteQueryBuilder}
/// Listen to changed in an [InfiniteQuery] and build the ui with the result.
/// {@endTemplate infiniteQueryBuilder}
class InfiniteQueryBuilder<T, A> extends StatefulWidget {
  /// [InfiniteQuery] to listen to.
  final InfiniteQuery<T, A> query;

  /// The builder function is called on each widget build.
  ///
  /// Passes [BuildContext], [InfiniteQueryState] and [InfiniteQuery].
  final Widget Function(
    BuildContext context,
    InfiniteQueryState<T> state,
    InfiniteQuery<T, A> query,
  ) builder;

  /// {@macro infiniteQueryBuilder}
  const InfiniteQueryBuilder({
    Key? key,
    required this.query,
    required this.builder,
  }) : super(key: key);

  @override
  _InfiniteQueryBuilderState<T, A> createState() =>
      _InfiniteQueryBuilderState<T, A>();
}

class _InfiniteQueryBuilderState<T, A>
    extends State<InfiniteQueryBuilder<T, A>> {
  late InfiniteQueryState<T> _state;
  late StreamSubscription<InfiniteQueryState<T>> _subscription;

  @override
  void initState() {
    super.initState();
    _state = widget.query.state;
    _subscription = widget.query.stream.listen((event) {
      setState(() {
        _state = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, widget.query);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
