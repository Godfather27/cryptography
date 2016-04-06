require 'openssl'
require 'yaml'
require 'csv'
require_relative 'stopwatch'

array = Array.new

for i in 1..100
	i *= 10
	s1 = Stopwatch.new
	for j in 0..i
		Random.new.bytes(16)
	end
	time_elapsed = s1.elapsed_time
	array[((i/10)-1)] = [(i*128),time_elapsed,nil]
end


data = "he goassei"
for i in 1..100
	i *= 10
	s2 = Stopwatch.new
	for j in 0..i
		cipher = OpenSSL::Cipher::AES.new(128, :CBC)
		cipher.encrypt
		cipher.random_key
		cipher.random_iv
		cipher.update(data) + cipher.final
	end
	time_elapsed = s2.elapsed_time
	array[((i/10)-1)][2]=time_elapsed
end

CSV.open("file.csv", "wb") do |csv|
	array.each do |set|
  		csv << set
	end
end