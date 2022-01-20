#ruby apiauth_signature.rb
#Enter Canonical String as single text
require 'base64'
require 'openssl'

#Get Canonical String from Console
puts "Enter Canonical String (method-type,content-type,content-MD5,requestURI,timestamp)"
canonical_string = gets.chomp

#Get Secret Key from Console
puts "Enter Secret Key"
secret_key = gets.chomp

#Encoding
sha1 = OpenSSL::Digest.new('sha1')
hmac = OpenSSL::HMAC.digest(sha1, secret_key, canonical_string)
signature = Base64.encode64(hmac).strip()

#Return Signature
puts "Signature:"
puts signature
