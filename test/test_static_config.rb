require 'test/unit'
require 'static_server'

class StaticConfigTest < Test::Unit::TestCase
  def test_deafult_values 
    conf = StaticConfig.new
    assert_equal "index.html", conf.root
    assert_equal 'public', conf.base_dir
    assert_equal( {}, conf.redirects)
    assert_equal( {}, conf.forwards)
  end

  def test_adding_forward
    conf = StaticConfig.new
    conf.forward '/paniz' => 'www.davidpaniz.com'
    assert_equal( {'/paniz' => 'www.davidpaniz.com'}, conf.forwards)

    conf.forward '/caelum' => 'www.caelum.com.br'
    assert_equal( {'/paniz' => 'www.davidpaniz.com', '/caelum' => 'www.caelum.com.br'}, conf.forwards)
  end

  def test_adding_redirect
    conf = StaticConfig.new
    conf.redirect '/paniz' => '/paniz.html'
    assert_equal( {'/paniz' => '/paniz.html'}, conf.redirects)

    conf.redirect '/caelum' => '/caelum.html'
    assert_equal( {'/paniz' => '/paniz.html', '/caelum' => '/caelum.html'}, conf.redirects)
  end

  def test_configuring_root
    conf = StaticConfig.new
    conf.root 'new_index.html'
    assert_equal 'new_index.html', conf.root

    conf.root 'new_index2.html'
    assert_equal 'new_index2.html', conf.root
  end

  def test_configuring_base_dir
    conf = StaticConfig.new()
    assert_equal 'public', conf.base_dir

    conf = StaticConfig.new(nil)
    assert_equal 'public', conf.base_dir

    conf = StaticConfig.new('my_dir')
    assert_equal 'my_dir', conf.base_dir

  end


end
