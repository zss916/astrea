import 'dart:collection';

class FixedSizeCollection<T> {
  final _queue = Queue<T>();
  final int maxSize;

  FixedSizeCollection({this.maxSize = 2});

  void add(T item) {
    if (_queue.length == maxSize) {
      _queue.removeFirst();
    }
    _queue.addLast(item);
  }

  List<T> get items => _queue.toList();

  int get length => _queue.length;

  void clear() => _queue.clear();

  @override
  String toString() => _queue.toString();
}
