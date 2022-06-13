/// * Description: Debounce Click
/// * Author:      郭文龙
/// * Date:        2022/6/12 2:28
/// * Email:       guowenlong20000@sina.com
class DebounceClick {
  DebounceClick();

  ///Default delay time milliseconds
  static int _defaultDelay = 500;

  ///is enable invoke callback
  bool _isEnable = true;

  ///Set default delay time milliseconds
  static setDefaultDelay(int delayMillisecond) {
    _defaultDelay = delayMillisecond;
  }

  ///debounce based on delayMillisecond time
  Function() debounce(Function onPressed, {int? delayMillisecond}) {
    return () {
      if (_isEnable) {
        onPressed();
        _isEnable = false;
        Future.delayed(
            Duration(milliseconds: delayMillisecond ?? _defaultDelay), () {
          _isEnable = true;
        });
      }
    };
  }
}
