import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_resend.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/forgot_pass/bloc/forgot_password_bloc.dart';
import 'package:ybc/presentation/screen/forgot_pass/bloc/forgot_password_event.dart';
import 'package:ybc/presentation/screen/forgot_pass/bloc/forgot_password_state.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/resend_bloc/resend_bloc.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/resend_bloc/resend_event.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/resend_bloc/resend_state.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';

class WidgetResendOTP extends StatefulWidget {
  final String email;

  const WidgetResendOTP({Key key, this.email}) : super(key: key);

  @override
  _WidgetResendOTPState createState() =>
      _WidgetResendOTPState();
}

class _WidgetResendOTPState
    extends State<WidgetResendOTP> {
  ResendOTPBloc _resendOTPBloc;



  @override
  void initState() {
    super.initState();
    _resendOTPBloc = BlocProvider.of<ResendOTPBloc>(context)
        ..add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOTPBloc, ResendOTPState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          BlocProvider.of<ResendOTPBloc>(context)
              .add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ResendOTPBloc, ResendOTPState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [_buildContent(state)],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isResendEnabled() {
    return _resendOTPBloc.state.isFormValid &&
        !_resendOTPBloc.state.isSubmitting;
  }

  Widget _buildContent(ResendOTPState state) {
    if (state.time != null) {
      return WidgetResend(
        onTap: () {
          BlocProvider.of<ResendOTPBloc>(context)
              .add(ResendOTPSubmit(email: widget.email));
        },
        time: state.time,
        isValid: isResendEnabled(),
      );
    } else {
      return WidgetSpacer();
    }
  }
}
