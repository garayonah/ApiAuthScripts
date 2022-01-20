#Enter Canonical String as Different Values
require 'base64'
require 'openssl'
data = {
"method-type"=>'GET',
"content-type"=>'application/json',
"content-MD5"=>'',
"requestURI"=>'/api/uri_goes_here',
"DATE"=>Time.now.gmtime.strftime('%a, %d %b %Y %T GMT')}
data.each do |key, value|
	puts "Enter #{key} | Default(#{value})"
	input = gets.chomp.strip
	data[key] = input if !input.empty?
end

#method-type,content-type,content-MD5,request_uri,timestamp
canonical_string = data.values.join(',')
puts 'Canonical String:'
puts canonical_string

puts "\nEnter access_id"
access_id = gets.chomp.strip

puts "\nEnter Parameters | Default({})"
params = gets.chomp.strip
params = '{}' if params.empty?

puts "\nEnter Secret Key"
secret_key = gets.chomp

signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), secret_key, canonical_string)).strip()
puts "\nSignature:"
puts signature

curl_headers = data.map{|key,value| "-H \"#{key}: #{value}\""}
