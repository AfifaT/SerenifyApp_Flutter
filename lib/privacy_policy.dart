import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Privacy Policy for Serenify"),
              Text("At Serenify, we take your privacy and the protection of your personal information very seriously. This Privacy Policy outlines the types of personal information we collect, how we use it, and how we keep it secure."),
              Text("1. Collection of Personal Information"),
              Text("We may collect personal information from you when you register for an account or use our app. This may include your name, email address, phone number, location, and other information that you provide to us."),
              Text("2. Use of Personal Information"),
              Text("We use your personal information to provide you with the services you request and to improve our app. This includes providing you with access to nearby psychiatrists, resources and articles related to mental health, activities for mental health care, assessment questions and scores, mood tracking, and the ability to post and share your thoughts. We may also use your information to communicate with you about updates and improvements to our app or to respond to your inquiries."),
              Text("3.Sharing of Personal Information"),
              Text("We do not share your personal information with third parties, except as required by law or as necessary to provide you with the services you request. We may share your information with healthcare professionals or organizations for the purpose of providing you with access to mental health resources or services."),
              Text("4.Security of Personal Information"),
              Text("We take appropriate measures to secure your personal information, including the use of encryption and secure servers. We also limit access to your information to authorized personnel who need it to perform their job duties."),
              Text("5. Retention of Personal Information"),
              Text("We retain your personal information for as long as necessary to provide you with the services you request or as required by law."),
              Text("6. Children's Privacy"),
              Text("Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13 years of age."),
              Text("7. Changes to this Privacy Policy"),
              Text("We may update this Privacy Policy from time to time. We will notify you of any changes by posting the updated policy on our website or within the app."),
              Text("8. Contact Us"),
              Text("If you have any questions or concerns about this Privacy Policy, please contact us at [insert contact information]."),
              Text("By using our app, you agree to the terms of this Privacy Policy.")
            ],
          ),
        ),
      ),
    );
  }
}

