require 'test_helper'

class RegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registry = registries(:one)
  end

  test "should get index" do
    get registries_url
    assert_response :success
  end

  test "should get new" do
    get new_registry_url
    assert_response :success
  end

  test "should create registry" do
    assert_difference('Registry.count') do
      post registries_url, params: { registry: { anexos_entregados: @registry.anexos_entregados, anexos_recibidos: @registry.anexos_recibidos, authority_id: @registry.authority_id, city_id: @registry.city_id, consecutivo: @registry.consecutivo, expedient_id: @registry.expedient_id, expert_id: @registry.expert_id, fecha_entrega: @registry.fecha_entrega, fecha_recepcion: @registry.fecha_recepcion, folio: @registry.folio, observaciones: @registry.observaciones, result_id: @registry.result_id, year_folio: @registry.year_folio } }
    end

    assert_redirected_to registry_url(Registry.last)
  end

  test "should show registry" do
    get registry_url(@registry)
    assert_response :success
  end

  test "should get edit" do
    get edit_registry_url(@registry)
    assert_response :success
  end

  test "should update registry" do
    patch registry_url(@registry), params: { registry: { anexos_entregados: @registry.anexos_entregados, anexos_recibidos: @registry.anexos_recibidos, authority_id: @registry.authority_id, city_id: @registry.city_id, consecutivo: @registry.consecutivo, expedient_id: @registry.expedient_id, expert_id: @registry.expert_id, fecha_entrega: @registry.fecha_entrega, fecha_recepcion: @registry.fecha_recepcion, folio: @registry.folio, observaciones: @registry.observaciones, result_id: @registry.result_id, year_folio: @registry.year_folio } }
    assert_redirected_to registry_url(@registry)
  end

  test "should destroy registry" do
    assert_difference('Registry.count', -1) do
      delete registry_url(@registry)
    end

    assert_redirected_to registries_url
  end
end
