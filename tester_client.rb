# require 'rubygems'
require 'websocket-client-simple'

url = ARGV.shift || 'ws://192.168.5.68:8080'

ws = WebSocket::Client::Simple.connect url

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send "I'm connected."
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
  puts "Something went wrong (perhaps the server is no longer running?). Exiting..."
  exit 1
end

loop do
  ws.send STDIN.gets.strip
end
