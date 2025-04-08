import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _login_by = "email"; 
  String initialCountry = 'US';
  //PhoneNumber phoneCode = PhoneNumber(isoCode: 'US', dialCode: "+1");
  String _phone = "";
  late BuildContext loadingContext;
  var countries_code = <String>[];

  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  

  onPressReg() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    confirmPassController.text.trim();
    String shopName = shopNameController.text.trim();
    String address = addressController.text.trim();
    loading();

    // var response = await AuthRepository().getRegResponse(
    //     name: name,
    //     email: email,
    //     password: password,
    //     confirmPassword: confirmPassword,
    //     shopName: shopName,
    //     address: address);
    // Navigator.pop(loadingContext);
    // if (response.result!) {
    //   ToastComponent.showDialog(response.message);
    //   Navigator.pop(context);
    // } else {
    //   if (context.mounted) {
    //     DialogBox.warningShow(context, response.message);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Registration",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            spacer(height: 14),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFF848484),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24),
                    child: Text(
                      "Personal Info",
                      style: TextStyle(
                          color: Color(0xFFE0E0E0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Container(height: 1,color: MyTheme.medium_grey,),
                  // spacer(height: 14),
                  inputFieldModel("Name", "Mr. Jhon", nameController),
                  spacer(height: 14),
                  inputFieldModel(
                      "Email", "seller@example.com", emailController),
                  spacer(height: 14),
                  inputFieldModel("Password", "● ● ● ● ●", passwordController,
                      isPassword: true),
                  spacer(height: 14),
                  inputFieldModel("Confirm your password", "● ● ● ● ●",
                      confirmPassController,
                      isPassword: true),
                  spacer(height: 14),
                ],
              ),
            ),
            spacer(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xFF848484)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24),
                    child: Text(
                      "Basic Info",
                      style: TextStyle(
                          color: Color(0xFFE0E0E0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Container(height: 1,color: MyTheme.medium_grey,),
                  // spacer(height: 14),
                  inputFieldModel("Shop Name", "Shop", shopNameController),
                  spacer(height: 14),
                  inputFieldModel("Address", "Dhaka", addressController),
                  spacer(height: 14),
                ],
              ),
            ),
           ],
        ),
      ),
    );
  }

  Widget inputFieldModel(
      String title, String hint, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFFE0E0E0),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 255, 255, 0.5)),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              autofocus: false,
              obscureText: isPassword,
             
            ),
          ),
        ],
      ),
    );
  }

  Widget spacer({height = 24}) {
    return SizedBox(
      height: double.parse(height.toString()),
    );
  }

  loading() {
    return showDialog(
        context: context,
        builder: (context) {
          loadingContext = context;
          return const AlertDialog(
              content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text("Please Wait..."),
            ],
          ));
        });
  }
}
