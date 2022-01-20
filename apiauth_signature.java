//javac apiauth_signature.java; java apiauth_signature
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Mac;
import java.util.Base64;
import java.util.Scanner;

public class apiauth_signature {
    public static void main(String args[]) {
        try {
						//Get Canonical String from Console
            System.out.println("Enter Canonical String (method-type,content-type,content-MD5,requestURI,timestamp)");
						String canonical_string = new Scanner(System.in).nextLine();

						//Get Secret Key from Console
            System.out.println("Enter Secret Key");
						String secret_key = new Scanner(System.in).nextLine();

						//Encoding
            Mac mac = Mac.getInstance("HmacSHA1");
            SecretKeySpec secret = new SecretKeySpec(secret_key.getBytes(),"HmacSHA1");
            mac.init(secret);
            byte[] digest = mac.doFinal(canonical_string.getBytes());
            String signature = Base64.getEncoder().encodeToString(digest);

						//Return Signature
            System.out.println("Signature:");
            System.out.println(signature);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

