require 'socket'

# create TCPServer object that listens on port 2345
server = TCPServer.new('localhost', 2345)
puts "TCP server listening on port 2345.."

loop do
  # wait for connection request from client, accept it and then return a TCPSocket
  socket = server.accept

  # read the first line from the socket and log it
  puts socket.gets

  response = "Hello World!\n"

  # write the http response into the socket in this order:
  # status code, header, blank line and actual response body
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print response

  # close the socket and terminate the connection
  socket.close
end
