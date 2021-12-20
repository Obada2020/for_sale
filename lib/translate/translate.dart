import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Signin_Appbar': 'تسجيل الدخول',
          'Signin_Label1': 'تسجيل الدخول',
          'Signin_Label2':
              ' مرحبا بك مجددا , أدخل رقم هاتفك للدخول إلى التطبيق',
          'Signin_Label3': 'رقم الهاتف',
          'Signin_Label4': 'بالنقر على متابعة ، فأنت توافق على ',
          'Signin_Label5': 'شروط وسياسة المستخدم',
          'Signin_Button': 'تسجيل الدخول',
          'Signin_Validation': 'يرجى إدخال الرقم أولا',
          'VerifyAccount_Appbar': 'تفعيل الحساب',
          'VerifyAccount_Label1': 'تفعيل الحساب',
          'VerifyAccount_Label2': 'لقد أرسلنا رمز إلى رقم جوالك ',
          'VerifyAccount_Label3': ' يحتوي على رمز تفعيل من 6 خانات',
          'VerifyAccount_Label4': 'لم تستلم رمز ؟',
          'VerifyAccount_Label5': 'إعادة الإرسال',
          'VerifyAccount_Button': 'تفعيل',
          'VerifyAccount_Snackbar': 'يرجى إدخال رمز التحقق أولا',
          'VerifyAccount_Check1': 'خطأ',
          'VerifyAccount_Check2': '! الرمز غير صحيح',
          'More_Appbar': 'المزيد',
          'More_Label1': 'الشروط والأحكام',
          'More_Label2': 'الإعدادات',
          'More_Label3': 'تواصل معنا',
          'PrivacyAndTerms_Appbar': 'الشروط والأحكام',
          'PrivacyAndTerms_Label1': 'شروط الاستخدام',
          'PrivacyAndTerms_Label2': '',
          'MyAccount_Appbar': 'حسابي',
          'MyAccount_Label1': 'أنت مسجل معنا برقم هاتف   :   ',
          'MyAccount_Label2': 'تسجيل الخروج',
          'MyAccount_Label3': 'إعلاناتي المفضلة',
          'MyAccount_Label4': 'إعلاناتي',
          'MyAccount_Label5': 'المراسلة المباشرة مع الإدارة',
          'Navbar_Home': 'الرئيسية',
          'Navbar_AddAds': 'إضافة إعلان',
          'Navbar_MyAccount': 'حسابي',
          'Navbar_More': 'المزيد',
          'Setting_Appbar': 'الإعدادات',
          'Setting_Language': 'اللغة',
          'Setting_Theme': 'الوضع المظلم',
          'view all': 'عرض الكل',
          'add-ad': 'إضافة إعلان',
          'type-ad': 'نوع الإعلان',
          'type-ad1': 'إعلان \nعادي',
          'type-ad2': 'إعلان\n مميز',
          'type-ad3': 'لديك عدد',
          'type-ad4': 'إعلان',
          'type-ad5': ' مدة الإعلان',
          'type-ad6': 'يوم',
          'section-ad': 'القسم',
          //
          'details-ad1': 'تفاصيل الإعلان',
          'details-ad2': 'صورة الإعلان',
          'details-ad3': 'انقر لرفع الصور',
          'details-ad4': 'العنوان',
          'details-ad5': 'ادخل عنوان الإعلان',
          'details-ad6': 'السعر',
          'details-ad7': 'ادخل سعر الإعلان بالدينار الكويتي',
          'details-ad8': 'د.ك',
          'details-ad9': 'الوصف',
          'details-ad10': 'ادخل وصف الإعلان',
          'details-ad11': 'التواصل',
          'details-ad12': 'رقم التواصل (الهاتف)',
          'details-ad13': 'ادخل رقم التواصل',
          'details-ad14': 'نشر الإعلان',
          'details-ad15': 'المواصفات',
          //
          'empty': 'لايوجد إعلانات هنا',
          'emptyfav': 'ليس لديك إعلانات مفضلة',
          'emptymyad': 'لم تقم بنشر إعلانات بعد',
          'Home_Page': 'الصفحة الرئيسية',
          'Ads_details_suggest': 'الإعلانات المقترحة',
          'Ads_details_No_suggest': 'لا يوجد إعلانات مقترحة',
          //
          'search': 'ابحث',
          'search2': 'ابحث عن',
        },
        'en': {
          'Signin_Appbar': 'Sign in',
          'Signin_Label1': 'Sign in',
          'Signin_Label2':
              'Welcome again , enter your phone number to enter the application ',
          'Signin_Label3': 'Phone number',
          'Signin_Label4': 'By clicking Continue, you agree to our User',
          'Signin_Label5': 'Terms and Policy',
          'Signin_Button': 'Sign in',
          'Signin_Validation': 'Please enter the number first',
          'VerifyAccount_Appbar': 'activate the account',
          'VerifyAccount_Label1': 'activate the account',
          'VerifyAccount_Label2': 'We have sent a code to your mobile number ',
          'VerifyAccount_Label3': ' Contains a 6-digit activation code',
          'VerifyAccount_Label4': 'Didn\'t receive a code ?',
          'VerifyAccount_Label5': 'Re-transmitter',
          'VerifyAccount_Button': 'activation',
          'VerifyAccount_Snackbar': 'Please enter the verification code first',
          'VerifyAccount_Check1': 'Error',
          'VerifyAccount_Check2': 'The code is incorrect !',
          'More_Appbar': 'More',
          'More_Label1': 'Privacy and terms',
          'More_Label2': 'Settings',
          'More_Label3': 'Connect with us',
          'PrivacyAndTerms_Appbar': 'Privacy and terms',
          'PrivacyAndTerms_Label1': 'Terms of use',
          'PrivacyAndTerms_Label2': '',
          'MyAccount_Appbar': 'My account',
          'MyAccount_Label1':
              'You are registered with us with a phone number   :   ',
          'MyAccount_Label2': 'Sign out',
          'MyAccount_Label3': 'My favorite ads',
          'MyAccount_Label4': 'My ads',
          'MyAccount_Label5': 'Direct Conversation with Admin',
          'Navbar_Home': 'Home',
          'Navbar_AddAds': 'Add Ads',
          'Navbar_MyAccount': 'My Account',
          'Navbar_More': 'More',
          'Setting_Appbar': 'Setting',
          'Setting_Language': 'Language',
          'Setting_Theme': 'Dark Mode',
          'view all': 'see all',
          'add-ad': 'Add Ad',
          'type-ad': 'Type Add',
          'type-ad1': 'Normal\nad',
          'type-ad2': 'Special\nad',
          'type-ad3': 'you have number',
          'type-ad4': 'ad',
          'type-ad5': 'Ad Duration',
          'type-ad6': 'day',
          'section-ad': 'Section',
          'details-ad1': 'Details Ad',
          'details-ad2': 'Ad pictures',
          'details-ad3': 'Click to upload photos',
          'details-ad4': 'Title',
          'details-ad5': 'Enter the title of the ad',
          'details-ad6': 'Price',
          'details-ad7': 'Enter the ad price in Kuwaiti dinars',
          'details-ad8': 'd.k',
          'details-ad9': 'the description',
          'details-ad10': 'Enter the description of the ad',
          'details-ad11': 'Communication',
          'details-ad12': 'Contact number (phone)',
          'details-ad13': 'Enter the contact number',
          'details-ad14': 'Publish the ad',
          'details-ad15': 'Specifications',

          //
          'empty': 'no ads found',
          'emptyfav': 'no favorite adds',
          'emptymyad': 'You haven\'t posted ads yet',
          'Home_Page': 'Home Page',
          'Ads_details_suggest': 'Suggested ads',
          'Ads_details_No_suggest': 'There are no suggested ads',
          //
          'search': 'search',
          'search2': 'search for',
        },
      };
}
