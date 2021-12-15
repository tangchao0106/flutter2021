import 'package:get/get.dart';

class ViewState {
  final _page = 0.obs;

  set page(value) => this._page.value = value;

  get page => this._page.value;
}
