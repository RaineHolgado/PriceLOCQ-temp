import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/services/pricelocq_services.dart';

enum Status {
  none,
  loading,
  done,
  error,
}

final loginStateController =
    StateNotifierProvider<LoginStateController, Status>(
        (ref) => LoginStateController(ref));

class LoginStateController extends StateNotifier<Status> {
  LoginStateController(this.ref) : super(Status.none);

  final ProviderRefBase ref;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> login({
    required String mobile,
    required String password,
  }) async {
    try {
      state = Status.loading;
      await ref.read(priceLocqServiceProvider).login(
            mobileNum: mobile,
            password: password,
          );
      state = Status.done;
    } catch (e) {
      state = Status.error;
      _errorMessage = e.toString();
    }
  }
}
