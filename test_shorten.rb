require "minitest"
require "minitest/autorun"

require 'shorten'

class TestShorten < Minitest::Test
  def setup
    @sh = Shorten.new
  end

  def test_asin_exec
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://www.amazon.com/exec/obidos/tg/detail/-/ASIN-VALUE-HERE")
  end

  def test_asin_gp
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://www.amazon.com/gp/product/ASIN-VALUE-HERE")
  end

  def test_asin_o
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://www.amazon.com/o/ASIN/ASIN-VALUE-HERE")
  end

  def test_asin_dp
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://www.amazon.com/dp/ASIN-VALUE-HERE")
  end

  def test_asin_pn_dp
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://www.amazon.com/ProductName/dp/ASIN-VALUE-HERE")
  end

  def test_asin_pn_dp_2
    assert_equal "ASIN-VALUE-HERE", @sh.asin("http://amazon.com/Elements-Style-Fourth-William-Strunk/dp/ASIN-VALUE_HERE/ref=sr_1_7?ie=UTF8&qid=1307695052&sr=8-7")
  end

  def test_asin_pn_dp_2
    assert_equal "143024710X", @sh.asin("http://www.amazon.com/HTML5-Games-Aditya-Ravi-Shankar/dp/143024710X/ref=pd_luc_mrairec_03_01_t_lh?ie=UTF8&psc=1")
  end

  def test_result
    assert_equal "http://amzn.com/ASIN-VALUE-HERE", Shorten.result("http://www.amazon.com/dp/ASIN-VALUE-HERE")
  end

  # def test_that_it_will_not_blend
  #   refute_match /^no/i, @meme.will_it_blend?
  # end

  # def test_that_will_be_skipped
  #   skip "test this later"
  # end
end
