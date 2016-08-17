require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest

  def ivar(var)
    @controller.instance_variable_get(var)
  end

  test "should get index" do
    get main_index_url, for_spell: 'this is a test.', for_format: 'this is (excluded) from text'
    assert_response :success
    assert_equal(ivar(:@for_spell), 'this is a test.')
    assert_equal(ivar(:@for_format), 'this is (excluded) from text')
    assert_equal(ivar(:@spell_results), '.tset a si siht')
    assert_equal(ivar(:@format_results), 'this is from text')
  end

end
