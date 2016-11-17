<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = "frontend/main";
$route['404_override'] = '';
$route['generator'] = 'generator/panel/index';
$route["p/(.*)"] = 'frontend/page/views/$1';
$route["p/(.*)/hal/(.*)"] = 'frontend/page/views/$1/hal/$2';
$route["products/(.*)"] = 'frontend/page/detail_produk/$1';
$route["judulberita/(.*)"] = 'frontend/page/blogdetail/$1';
$route["reg/(.*)"] = 'frontend/page/reg_page/$1';
$route["testimoni/(.*)"] = 'frontend/page/add_testimonial/$1';
$route["sendemail/(.*)"] = 'frontend/page/sendemail/$1';
$route["user-login"] = 'frontend/page/login_page';
$route["loginproses"] = 'frontend/page/loginproses';
$route["logout"] = 'frontend/page/logout';
$route["member-profile"] = 'frontend/page/user_profile_page';
$route["change-password"] = 'frontend/page/change_password_page';
$route["change-password-process"] = 'frontend/page/changepass';
$route["new-password-process"] = 'frontend/page/newpass';
$route["forgot-password"] = 'frontend/page/forgot_password_page';
$route["forgot-password/process"] = 'frontend/page/proseslupapassword';
$route["password-recovery/(.*)"] = 'frontend/page/recovery_password/$1';
$route["orderproduct/(.*)"] = 'frontend/page/order_product_page/$1';
$route["activate/(.*)"] = 'frontend/page/prosesaktivasi/$1';
$route["register-process"] = 'frontend/page/registerprocess';
$route["member-profile/change-user-process"] = 'frontend/page/ubah_profil_user';
$route["member-profile/upload-picture"] = 'frontend/page/ubah_foto_user';
$route["registerprocess/(.*)"] = 'frontend/page/reg_save/$1';
$route["testimonialprocess/(.*)"] = 'frontend/page/testimonial_save/$1';


/* End of file routes.php */
/* Location: ./application/config/routes.php */