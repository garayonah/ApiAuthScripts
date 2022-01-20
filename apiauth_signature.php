<?php
//php apiauth_signature.php

//Today
echo(gmdate('D, d M Y H:i:s T'));

//Get Canonical String from Console
echo("Enter Canonical String (method-type,content-type,content-MD5,requestURI,timestamp)\n");
$canonical_string = readline();

//Get Secret Key from Console
echo("Enter Secret Key\n");
$secret_key = readline();

//Encoding 
$pass1 = hash_hmac('sha1', $canonical_string, $secret_key, true);
$signature = base64_encode($pass1);

//Return Signature
echo("Signature:\n");
echo($signature."\n");
?>
