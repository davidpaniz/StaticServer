require 'test/unit'
require 'static_server'
require "rack/test"

class BasicTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    # will load files ffrom 'public' dir in the project root
    StaticServer.start
  end

  def test_starting_server
    get "/"

    assert last_response.ok?
    assert_equal "<html>Index</html>\n", last_response.body
  end
end
