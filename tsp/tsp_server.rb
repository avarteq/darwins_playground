#! /usr/bin/env ruby
require 'cgi'
require 'erb'
require 'webrick'

include WEBrick

server = HTTPServer.new(:Port => 8042)

server.mount('/', HTTPServlet::FileHandler, File.dirname(__FILE__) + "/../gui/." )
server.mount('/javascript', HTTPServlet::FileHandler, File.dirname(__FILE__) + "/../gui/javascript/" )

server.mount_proc('/coords' )    do    |request, response|
  response['Content-Type'] = 'text/javascript'
  coords = File.open( File.dirname(__FILE__) + "/../gui/current_coords.txt" ).read
  response.body = coords
end

trap('INT' ) {    server.shutdown    }

server.start