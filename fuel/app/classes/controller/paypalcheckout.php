<?php
class Controller_PaypalCheckout extends Controller
{
  public function action_index()
  {
//     var_dump($_POST);
//     die();
//     $_POST = $_GET;
    switch ($_POST['yen']){
    case '100':
      $point = '200';
      break;
    case '800':
      $point = '1700';
      break;
    case '1400':
      $point = '3000';
      break;
    default:
      die(View::forge('404'));
    }    
//    define("Paypal_SandboxFlag", Config::get('my.Paypal_SandboxFlag'));
//    define("Paypal_API_UserName", Config::get('my.Paypal_API_UserName'));
//    define("Paypal_API_Password", Config::get('my.Paypal_API_Password'));
//    define("Paypal_API_Signature", Config::get('my.Paypal_API_Signature'));
//    var_dump(Config::get('my.Paypal_API_UserName'));
    
//require_once ("paypalfunctions.php");
//    require_once APPPATH.'vendor/tw/twitteroauth/twitteroauth.php';
    //require_once APPPATH.'vendor/paypal/paypalfunctions.php';
    $paypal_function = new Model_PaypalFunction();
//    $paypal_function->receiver = $_POST['receiver'];
//    $paypal_function->sender = $usr_id;
//    $paypal_function->create_at = date("Y-m-d H:i:s");

$PaymentOption = "PayPal";
if ( $PaymentOption == "PayPal")
{
        // ==================================
        // PayPal Express Checkout Module
        // ==================================

	
	        
        //'------------------------------------
        //' The paymentAmount is the total value of 
        //' the purchase.
        //'
        //' TODO: Enter the total Payment Amount within the quotes.
        //' example : $paymentAmount = "15.00";
        //'------------------------------------

        $paymentAmount = $_POST['yen'];
        
        
        //'------------------------------------
        //' The currencyCodeType  
        //' is set to the selections made on the Integration Assistant 
        //'------------------------------------
        $currencyCodeType = "JPY";
        $paymentType = "Sale";

        //'------------------------------------
        //' The returnURL is the location where buyers return to when a
        //' payment has been succesfully authorized.
        //'
        //' This is set to the value entered on the Integration Assistant 
        //'------------------------------------
        //$returnURL = "http://generator-stg.komahana.info/testpaypal_2/ordercomp.php";
        $returnURL = "http://".Config::get('my.domain')."/paypalordercomp/";

        //'------------------------------------
        //' The cancelURL is the location buyers are sent to when they hit the
        //' cancel button during authorization of payment during the PayPal flow
        //'
        //' This is set to the value entered on the Integration Assistant 
        //'------------------------------------
        //$cancelURL = "http://generator-stg.komahana.info/testpaypal_2/cancel_3c.php";
        $cancelURL = "http://".Config::get('my.domain')."/pack/?p=".$_POST["p"];

        //'------------------------------------
        //' Calls the SetExpressCheckout API call
        //'
        //' The CallSetExpressCheckout function is defined in the file PayPalFunctions.php,
        //' it is included at the top of this file.
        //'-------------------------------------------------

        
		$items = array();
		$items[] = array('name' => $point.' point', 'amt' => $paymentAmount, 'qty' => 1);
	
		//::ITEMS::
		
		// to add anothe item, uncomment the lines below and comment the line above 
		// $items[] = array('name' => 'Item Name1', 'amt' => $itemAmount1, 'qty' => 1);
		// $items[] = array('name' => 'Item Name2', 'amt' => $itemAmount2, 'qty' => 1);
		// $paymentAmount = $itemAmount1 + $itemAmount2;
		
		// assign corresponding item amounts to "$itemAmount1" and "$itemAmount2"
		// NOTE : sum of all the item amounts should be equal to payment  amount 

		$resArray = $paypal_function->SetExpressCheckoutDG( $paymentAmount, $currencyCodeType, $paymentType, 
												$returnURL, $cancelURL, $items );
        $ack = strtoupper($resArray["ACK"]);
        if($ack == "SUCCESS" || $ack == "SUCCESSWITHWARNING")
        {
                $token = urldecode($resArray["TOKEN"]);
                $paypal_function->RedirectToPayPalDG( $token );
        } 
        else  
        {
                //Display a user friendly Error on the page using any of the following error information returned by PayPal
                $ErrorCode = urldecode($resArray["L_ERRORCODE0"]);
                $ErrorShortMsg = urldecode($resArray["L_SHORTMESSAGE0"]);
                $ErrorLongMsg = urldecode($resArray["L_LONGMESSAGE0"]);
                $ErrorSeverityCode = urldecode($resArray["L_SEVERITYCODE0"]);
                
                echo "SetExpressCheckout API call failed. ";
                echo "Detailed Error Message: " . $ErrorLongMsg;
                echo "Short Error Message: " . $ErrorShortMsg;
                echo "Error Code: " . $ErrorCode;
                echo "Error Severity Code: " . $ErrorSeverityCode;
        }
}

  }
}
