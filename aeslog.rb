require_relative './aescrypt'
require 'open-uri'

if ARGV.empty?
  p '请输入密码和文件 ruby aeslog.rb password file'
  return
end

password = ARGV[0]
file = ARGV[1]

if file.start_with?('http')
  open(file).each_line do |line|
    p AESCrypt.decrypt(line, password).force_encoding('utf-8')
  end
elsif file.start_with?('./') || file.start_with?('/') || file.start_with?('~/')
  File.open(file, 'r').each_line do |line|
    p AESCrypt.decrypt(line, password).force_encoding('utf-8')
  end
else
  p AESCrypt.decrypt(file, password).force_encoding('utf-8')
end
