import 'package:async_redux/async_redux.dart';
import 'package:q_yaar/data/redux/app_state.dart';

Store<AppState> store = Store<AppState>(
  initialState: AppState.initial(),
);
