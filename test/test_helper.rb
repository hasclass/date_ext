require 'rubygems'
require 'test/unit'
require 'redgreen'
require 'shoulda'
require 'active_support'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'date_ext'

class Test::Unit::TestCase
end
