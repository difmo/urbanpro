import 'package:URBANPRO/models/admin/terms_model.dart';

class TermsService {
  TermsModel _terms = TermsModel(
    terms: """
1) Tutor registration is **FREE**.

2) If leads are grabbed directly from the app, only the **lead cost in coins** will be deducted from the tutor’s wallet.

3) The home tutor agency will collect the **first month’s fee** from parents and then transfer the remaining amount to the tutor **after deducting commission charges**. From the second month onward, the tutor can collect fees directly from parents.

4) If a tutor takes leads or inquiries directly from us (private basis), the commission structure is:  
   a) **60% on the first lead** of the first month, and **50% on the first-month fee** from subsequent leads (monthly fee structure).  
   b) For **hourly-based tuition**, **seven classes’ fees** will be charged as a commission (**not seven hours**).  
   c) If tuition continues for **less than 3 months**, **30% commission** of the total fee will be charged.

5) **No commission** will be charged if a tutor grabs leads directly from the **Home Tutors App**.

6) If a tutor attempts to **cheat the agency or clients**, legal action may be taken, and direct home visits may be conducted.

7) When a tutor grabs leads directly from the app, the **entire responsibility** lies with the tutor, except when a lead is proven invalid.

8) If a **lead is proven invalid** within **7 hours**, the **coins will be refunded** back to the tutor’s wallet.

9) **No refunds** will be provided once a tutor **recharges or upgrades their wallet**.

10) If a tutor takes leads or inquiries directly from the agency, the agency holds responsibility **until the first class is confirmed**.

11) The agency **reserves the right to update the app** based on requirements and tutor feedback.

Thank you 🙏
  """,
  );

  Future<TermsModel> fetchTerms() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate API delay
    return _terms;
  }

  Future<void> updateTerms(TermsModel terms) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate save delay
    _terms = terms;
  }
}
