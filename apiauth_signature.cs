//mcs apiauth_signature.cs
//mono apiauth_signature.exe
using System;
using System.Text;
using System.Security.Cryptography;
					
public class Program
{
	public static void Main()
	{
		//Get Canonical String from Console
		Console.WriteLine("Enter Canonical String (method-type,content-type,content-MD5,requestURI,timestamp)");
		string canonical_string = Console.ReadLine();

		//Get Secret Key from Console
		Console.WriteLine("Enter Secret Key");
		string secret_key = Console.ReadLine();

		//Encoding
		byte[] hashKey = Encoding.ASCII.GetBytes(secret_key);
		HMACSHA1 myhmacsha1 = new HMACSHA1(hashKey);
		byte[] hashCanonical = Encoding.ASCII.GetBytes(canonical_string);
		byte[] hashSignature = myhmacsha1.ComputeHash(hashCanonical);
		string signature = System.Convert.ToBase64String(hashSignature);

		//Return Signature
		Console.WriteLine("Signature:");
		Console.WriteLine(signature);
		
	}
}
