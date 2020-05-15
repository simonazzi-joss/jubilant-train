import 'package:test/test.dart';
// import '../lib/c';


void main() {
  test('Counter value should have incremented', () {
    Counter counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}


class Counter{
  int value = 0;

  increment() {
    this.value++;
  }
}