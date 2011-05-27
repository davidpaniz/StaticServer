require 'test/unit'
require 'static_server'
require "rack/test"

class ConfigurationTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    StaticServer.start('test/integration/other_dir') {|map|
      map.root 'init.html'
      map.redirect '/test_redirect' => 'http://www.caelum.com.br'
      map.forward '/some' => 'some_html.html'
    }
  end

  def test_root_server
    get "/"

    assert last_response.ok?
    assert_equal "<html>init</html>\n", last_response.body
  end

  def test_forward_server
    get "/some"

    assert last_response.ok?
    assert_equal "<html>some_html</html>\n", last_response.body
  end

  def test_redirect_server
    get "/test_redirect"

    assert_equal "http://www.caelum.com.br", last_response.original_headers["Location"]
    assert_equal 302, last_response.status
  end
end
