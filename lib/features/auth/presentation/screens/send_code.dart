import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/cusotm_lodaing_indicator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubits/forget_password_cubit/forget_password_cubit.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){
          navigateReplacement(context: context, route: Routes.login);
        },),
        title: Text(

          AppStrings.forgetPassword.tr(
            context,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is SendCodeSucess){
              showToast(message: state.message, state: ToastStates.success);
              navigateReplacement(context: context, route: Routes.resetPassword);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: const CustomImage(imgPath: AppAssets.lock),
                    ),
                    Text(
                      AppStrings.sendResetLinkInfo.tr(context),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                      hint: AppStrings.email.tr(context),
                      validate: (data) {
                        if (data!.isEmpty || !data.contains('@gmail.com')) {
                          return AppStrings.pleaseEnterValidEmail.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    state is SendCodeLoading
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                      onPressed: () {
                        if (BlocProvider.of<ForgetPasswordCubit>(context)
                            .sendCodeKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .sendCode();
                        }
                      },
                      text: AppStrings.sendResetLink.tr(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
