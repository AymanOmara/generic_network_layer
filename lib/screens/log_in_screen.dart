import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/text_field.dart';
import 'login_cubit.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),

                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            TF(
                              textLabel: "email",
                              validationMode: AutovalidateMode.onUserInteraction,
                              onChange: (txt) {},
                              validator: (txt) => txt == null || txt == ""
                                  ? "required_filed"
                                  : null,
                              tFType: TFType.txt,
                              space: 12,
                              prefixIcon: const Icon(Icons.email),
                            ),
                            TF(
                              textLabel: "password",
                              validationMode: AutovalidateMode.always,
                              onChange: (txt) {},
                              validator: (txt) =>
                              txt == null || txt == "required_filed"
                                  ? ""
                                  : null,
                              tFType: TFType.txt,
                              space: 12,
                              iconButton: IconButton(
                                icon: Icon(cubit.isPasswordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                color: Colors.grey,
                                onPressed: () => cubit.changePasswordVisible(),
                              ),
                              secured: cubit.isPasswordVisible,
                              prefixIcon: const Icon(Icons.lock),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
