import 'package:flutter/material.dart';
import 'package:smart_carboy/view/register/register_view.dart';
import '../../core/constants/icon/app_icons.dart';
import '../home/home_view.dart';
import 'login_view_model.dart';
import '../main/main_view.dart';
import '../../widgets/base_container.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';
import '../../core/extensions/context_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: BaseContainer(
                image: 'assets/girissonrasi.png',
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.dynamicHeight(0.05),
                          horizontal: context.dynamicWidth(0.16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: context.dynamicHeight(0.06)),
                            child:
                                Image.asset('assets/girislogosu.png', scale: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: context.dynamicHeight(0.1)),
                            child: Column(
                              children: [
                                CustomTextFormField(viewModel.email,
                                    hintText: 'Kullan??c?? Ad??',
                                    icon: AppIcons.person),
                                CustomTextFormField(viewModel.password,
                                    hintText: '??ifre', icon: AppIcons.lock),
                                Container(
                                    height: context.dynamicHeight(0.06),
                                    child: CustomButton(
                                        text: 'Giri?? Yap',
                                        onPressed: () {
                                          viewModel.login();
                                        })),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 10,
                                        child: CustomButton(
                                            text: 'Kay??t Ol', onPressed: () => context.navigateTo(RegisterView()))),
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                        flex: 18,
                                        child: CustomButton(
                                            text: '??ifremi Unuttum',
                                            onPressed: null))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    LoadingWidget(viewModel.isLoading)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
