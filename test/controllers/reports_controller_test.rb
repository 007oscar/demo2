require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get estadistica" do
    get reports_estadistica_url
    assert_response :success
  end

  test "should get validacion" do
    get reports_validacion_url
    assert_response :success
  end

  test "should get verificacion" do
    get reports_verificacion_url
    assert_response :success
  end

  test "should get bitacora" do
    get reports_bitacora_url
    assert_response :success
  end

  test "should get caractula1" do
    get reports_caractula1_url
    assert_response :success
  end

  test "should get caractula2" do
    get reports_caractula2_url
    assert_response :success
  end

end
