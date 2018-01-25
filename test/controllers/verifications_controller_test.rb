require 'test_helper'

class VerificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification = verifications(:one)
  end

  test "should get index" do
    get verifications_url
    assert_response :success
  end

  test "should get new" do
    get new_verification_url
    assert_response :success
  end

  test "should create verification" do
    assert_difference('Verification.count') do
      post verifications_url, params: { verification: { anexos_componentes_electronicos: @verification.anexos_componentes_electronicos, anexos_disp_alm_elect: @verification.anexos_disp_alm_elect, anexos_equipo_de_comunicacion: @verification.anexos_equipo_de_comunicacion, anexos_equipos_de_computo: @verification.anexos_equipos_de_computo, anexos_material_fotografico: @verification.anexos_material_fotografico, city_id: @verification.city_id, coincide_expediente: @verification.coincide_expediente, coinciden_anexos: @verification.coinciden_anexos, expedient_id: @verification.expedient_id, expert_id: @verification.expert_id, fecha: @verification.fecha, incluye_anexos: @verification.incluye_anexos, incluye_expediente: @verification.incluye_expediente, otros: @verification.otros, registry_id: @verification.registry_id } }
    end

    assert_redirected_to verification_url(Verification.last)
  end

  test "should show verification" do
    get verification_url(@verification)
    assert_response :success
  end

  test "should get edit" do
    get edit_verification_url(@verification)
    assert_response :success
  end

  test "should update verification" do
    patch verification_url(@verification), params: { verification: { anexos_componentes_electronicos: @verification.anexos_componentes_electronicos, anexos_disp_alm_elect: @verification.anexos_disp_alm_elect, anexos_equipo_de_comunicacion: @verification.anexos_equipo_de_comunicacion, anexos_equipos_de_computo: @verification.anexos_equipos_de_computo, anexos_material_fotografico: @verification.anexos_material_fotografico, city_id: @verification.city_id, coincide_expediente: @verification.coincide_expediente, coinciden_anexos: @verification.coinciden_anexos, expedient_id: @verification.expedient_id, expert_id: @verification.expert_id, fecha: @verification.fecha, incluye_anexos: @verification.incluye_anexos, incluye_expediente: @verification.incluye_expediente, otros: @verification.otros, registry_id: @verification.registry_id } }
    assert_redirected_to verification_url(@verification)
  end

  test "should destroy verification" do
    assert_difference('Verification.count', -1) do
      delete verification_url(@verification)
    end

    assert_redirected_to verifications_url
  end
end
