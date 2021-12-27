import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/entity/cart.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_event.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class PaymentFormBloc extends Bloc<PaymentFormEvent, PaymentFormState> {
  final UserRepository userRepository;

  PaymentFormBloc({
    @required this.userRepository,
  });

  @override
  PaymentFormState get initialState => PaymentFormState.empty();

  @override
  Stream<PaymentFormState> mapEventToState(PaymentFormEvent event) async* {
    if (event is InitPaymentForm) {
      yield* _mapInitPaymentFormToState();
    } else if (event is CartLoaded) {
      yield* _mapLoadPaymentFormToState(event.carts);
    } else if (event is PaymentFormSubmitted) {
      yield* _mapPaymentFormSubmittedToState(
          event.name,
          event.email,
          event.address,
          event.cityId,
          event.districtId,
          event.wardId,
          event.tel,
          event.paymentType,
          event.token);
    }
  }

  Stream<PaymentFormState> _mapInitPaymentFormToState() async* {
    yield PaymentFormState.empty();
  }

  Stream<PaymentFormState> _mapLoadPaymentFormToState(List<Cart> carts) async* {
    yield state.update(carts: carts);
  }

  Stream<PaymentFormState> _mapPaymentFormSubmittedToState(
      String name,
      String email,
      String address,
      int cityId,
      int districtId,
      int wardId,
      String tel,
      int paymentType,
      String token) async* {
    try {
      if (state.checkReadyToOrder()) {
        yield PaymentFormState.loading(state.copyWith(
            status:
                DioStatus(message: '', code: DioStatus.API_PROGRESS_NOTIFY)));
        int paymentMethodId = 1;

        var response = await userRepository.createInvoiceBody(
            name: name,
            email: email,
            address: address,
            cityId: 1,
            districtId: 1,
            wardId: 1,
            tel: tel,
            paymentType: paymentMethodId,
            apiToken: token);

        if (response.status == Endpoint.SUCCESS) {
          yield PaymentFormState.success(state.copyWith(
              status: DioStatus(
                  message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY)));
          Future.delayed(Duration(seconds: 2), () {
            // AppNavigator.navigatePaymentResult(data: response.data);

          });
        } else {
          yield PaymentFormState.failure(state.copyWith(
              status: DioStatus(
                  message: response.msg, code: DioStatus.API_FAILURE_NOTIFY)));
        }
      }
    } catch (e) {
      yield PaymentFormState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }
}
