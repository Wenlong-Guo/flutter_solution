import 'package:test/test.dart';
import 'package:solution/solution.dart';

void main() {
  test('just invoke one time in delay', () {
    int count = 0;

    var debounceFun1 = DebounceClick().debounce(() {
      count = count + 1;
    });

    debounceFun1.call();
    debounceFun1.call();
    debounceFun1.call();
    debounceFun1.call();

    expect(count, 1);
  });

  test('invoke specified time after delay', () async  {
    DebounceClick.setDefaultDelay(500);

    int count = 0;

    var debounceFun2 = DebounceClick().debounce(() {
      count = count + 1;
    });

    debounceFun2.call();
    await Future.delayed(Duration(milliseconds: 500), () => debounceFun2.call());
    await Future.delayed(Duration(milliseconds: 500), () => debounceFun2.call());
    await Future.delayed(Duration(milliseconds: 500), () => debounceFun2.call());

    expect(count, 4);
  });

  test('Do not interfere with each other', () async  {
    DebounceClick.setDefaultDelay(500);

    int count1 = 0;
    int count2 = 0;

    var debounceFun1 = DebounceClick().debounce(() {
      count1 = count1 + 1;
    });

    var debounceFun2 = DebounceClick().debounce(() {
      count2 = count2 + 1;
    });

    debounceFun1.call();
    debounceFun2.call();

    expect(count1, 1);
    expect(count2, 1);

    debounceFun1.call();
    debounceFun2.call();
    await Future.delayed(Duration(milliseconds: 1000), () => debounceFun1.call());
    await Future.delayed(Duration(milliseconds: 1000), () => debounceFun2.call());

    expect(count1, 2);
    expect(count2, 2);
  });
}
