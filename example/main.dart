import 'package:solution/solution.dart';

void main() {
  DebounceClick.setDefaultDelay(1000);
  int count = 0;
  var onPressed = () {
    count = count + 1;
  };
  var debounceOnPressed = DebounceClick().debounce(onPressed);
  debounceOnPressed.call();
  debounceOnPressed.call();
  debounceOnPressed.call();
  print(count);
}
