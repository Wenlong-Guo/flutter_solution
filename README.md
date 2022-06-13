# Solution

- [About solution](#About-solution)
- [Installing](#Installing)
- [Function](#Function)
    - [Debounce](#Debounce)


# About-solution
* Common solutions for Dart/Flutter
* The current version includes debounce functions
* More solution will be added in the future

# Installing
Add solution to your pubspec.yaml file:

```yaml
dependencies:
  solution: ^1.0.1
```

Import get in files that it will be used:

```dart
import 'package:solution/solution.dart';
```

# Function
## Debounce
Prevent a `Voidcallback` from being called continuously.  
This function is usually used for App of Widget

### Usage
Simple
```
TextButton(
  onPressed: DebounceClick().debounce(() {
    print("time:${DateTime.now().second}");
  }),
  child: const Text("Click")
```
The `debounce()` is return `function()`,so you can use many place.
```
ListTile(
  title: Text("Back"),
  subtitle: Text('Back to HomePage'),
  onTap: DebounceClick().debounce(() {
    print("time:${DateTime.now().second}");
  }),
)
```
Set global debounce default delay time(Default delay time is 500 millisecond)
```
DebounceClick.setDefaultDelay(1000);
```
Set one debounce delay time
```
TextButton(
  onPressed: DebounceClick().debounce(() {
    print("time:${DateTime.now().second}");
  }, delayMillisecond: 1000),
  child: const Text("Click")
```




