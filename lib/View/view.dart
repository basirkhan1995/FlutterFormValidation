import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_validation/Components/input_field.dart';
import 'package:flutter_form_validation/Provider/setting_provider.dart';
import 'package:flutter_form_validation/View/success_validation.dart';
import 'package:provider/provider.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();


  final provider = SettingsProvider();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form validation"),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                   //If form is validated do this
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SuccessValidation()));
                  }else{
                    //Other wise show a message
                    //Show Snack bar
                    provider.showSnackBar("Fix the error", context);
                  }
                },
                icon: const Icon(Icons.check)),
          )
        ],
      ),

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [

              //Full name
              InputField(
                icon: Icons.account_circle_rounded,
                label: "Full name",
                controller: fullName,
                validator: (value)=> provider.validator(value, "Full name is required")
              ),

              //Phone number
              InputField(
                  icon: Icons.phone,
                  label: "Phone",
                  controller: phone,
                  inputType: TextInputType.phone,
                  inputFormat: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value)=> provider.phoneValidator(value)
              ),

              //Password
              Consumer<SettingsProvider>(
                builder: (context,notifier,child) {
                  return InputField(
                      icon: Icons.lock,
                      label: "Password",
                      controller: password,
                      isVisible: !notifier.isVisible,
                      trailing: IconButton(
                        onPressed: ()=> notifier.showHidePassword(),
                        icon: Icon(!notifier.isVisible? Icons.visibility_off : Icons.visibility),
                      ),
                      validator: (value)=> provider.passwordValidator(value)
                  );
                }
              ),

              //Confirm password
              Consumer<SettingsProvider>(
                builder: (context,notifier,child) {
                  return InputField(
                      icon: Icons.lock,
                      label: "Re-enter password",
                      controller: confirmPassword,
                      isVisible: !notifier.isVisible,
                      trailing: IconButton(
                        onPressed: ()=> notifier.showHidePassword(),
                        icon: Icon(!notifier.isVisible? Icons.visibility_off : Icons.visibility),
                      ),
                      validator: (value)=> provider.confirmPass(value,password.text)
                  );
                }
              ),

              //Email validator
              InputField(
                  icon: Icons.email,
                  label: "Email",
                  controller: email,
                  inputType: TextInputType.emailAddress,
                  validator: (value)=> provider.emailValidator(value)
              ),




            ],
          ),
        ),
      ),
    );
  }
}
