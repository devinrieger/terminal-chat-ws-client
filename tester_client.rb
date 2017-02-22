require 'rubygems'
require 'websocket-client-simple'

url = ARGV.shift || 'ws://71.190.177.92:8080'

ws = WebSocket::Client::Simple.connect url

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send 'hello!!!'
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
  ws.send STDIN.gets.strip
end
