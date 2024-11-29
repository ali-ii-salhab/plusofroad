class ApiApplinks {
  // http://127.0.0.1:8000/booking/manualreservation/1/
  static const server = 'http://192.168.1.11:8000/booking/';
  static const serverimage = 'http://192.168.1.11:8000/';
  static const addstopsale = 'http://192.168.1.11:8000/';
  static const viewavailability = 'http://192.168.1.11:8000/';

  static const photosedit = 'http://192.168.1.11:8000/';
  static const usersview = 'http://192.168.1.11:8000/';
  static const usersadd = 'http://192.168.1.11:8000/';

  static const usersedit = 'http://192.168.1.11:8000/';
  static const usersdelete = 'http://192.168.1.11:8000/';

  static const photos = 'http://192.168.1.11:8000/';
  static const deleteavailability = 'http://192.168.1.11:8000/';
  static const editavailability = 'http://192.168.1.11:8000/';
  static const editUpdatedownrate = 'http://192.168.1.11:8000/';

  static const viewUpdatedownrate = 'http://192.168.1.11:8000/';
  static const deleteUpdatedownrate = 'http://192.168.1.11:8000/';
  static const group = 'http://192.168.1.11:8000/';

  static const updategroupstatus = 'http://192.168.1.11:8000/';

  static const groupadd = 'http://192.168.1.11:8000/';

  static const groupedit = 'http://192.168.1.11:8000/';

  static const groupdelete = 'http://192.168.1.11:8000/';

  static const mealplan = 'http://192.168.1.11:8000/';

  static const addpayment = 'http://192.168.1.11:8000/';
  static const viewpayment = 'http://192.168.1.11:8000/';
  static const editpayment = 'http://192.168.1.11:8000/';
  static const deletepayment = 'http://192.168.1.11:8000/';
  static const viewrate = 'http://192.168.1.11:8000/';
  static const addrate = 'http://192.168.1.11:8000/';
  static const editrate = 'http://192.168.1.11:8000/';
  static const deleterate = 'http://192.168.1.11:8000/';
  static const room = 'http://192.168.1.11:8000/';
  static const rooms = 'http://192.168.1.11:8000/';
  static const getgroupsfromrooms = 'http://192.168.1.11:8000/';
  static const deleteroomimage = 'http://192.168.1.11:8000/';

  static const getroomimages = 'http://192.168.1.11:8000/';
  static const uploadroomphotos = 'http://192.168.1.11:8000/';
  static const updateavailability = 'http://192.168.1.11:8000/';

  static const addUpdatedownrate = 'http://192.168.1.11:8000/';
  static const getavailability = 'http://192.168.1.11:8000/';
  static const addhoteldetails = 'http://192.168.1.11:8000/';
  static const deletehotell = 'http://192.168.1.11:8000/';
  static const editperiod = 'http://192.168.1.11:8000/';
  static const deleteperiod = 'http://192.168.1.11:8000/';
  static const viewperiod = 'http://192.168.1.11:8000/';
  static const addperiod = 'http://192.168.1.11:8000/';

  static const me = serverimage + "auth/users/me/";
  static const String login = 'http://192.168.1.11:8000/auth/jwt/create/';
  static const String editstopsale =
      'http://192.168.1.11:8000/auth/jwt/create/';
  static const String reset_password =
      'http://192.168.1.11:8000/auth/jwt/create/';
  static const String verifycode = 'http://192.168.1.11:8000/auth/jwt/create/';

  static const String addavailability =
      'http://192.168.1.11:8000/auth/jwt/create/';
  static const String activate =
      "http://192.168.1.11:8000/auth/users/activation/";

  static const String stopsale =
      'http://192.168.1.11:8000/auth/users/reset_password/';
  static const String deletestopsale =
      'http://192.168.1.11:8000/auth/users/reset_password/';

  static const String reset_password_confirmation =
      'http://192.168.1.11:8000/auth/users/reset_password_confirm/';

  static const String signup = 'http://192.168.1.11:8000/auth/users/';
  static const String hotels = server + 'hotels/';

  // "https://alisalhabqq11.000webhostapp.com/";
  static const roomimagesfolder = server + "upload/roomimages/";
  static const profilesimagefolder = server + "upload/usersprofileimages/";
  static const String forgetpassword =
      server + "forgetpassword/forgetpassword.php";
  static const String resetpassword =
      server + "forgetpassword/resetpassword.php";
  static const String verifycodeforget =
      server + "forgetpassword/verifycode.php";
  // auth

  static const String getrooms = server + "customer/Home/viewrooms.php";
  static const String getroomphoto =
      server + "customer/Home/getroomsimages.php";
  static const String test = server + "manualreservation/";
}
// addhotel/hotelphotosview.php
// https://alisalhabqq11.000webhostapp.com/auth/login.php
// rooms/add.php