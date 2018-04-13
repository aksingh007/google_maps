require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  context 'maps controller test' do
    setup do
      @map = maps(:one)
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:maps)
    end

    should "get new" do
      get :new
      assert_response :success
    end

    should "create map" do
      assert_difference('Map.count') do
        post :create, map: { address: @map.address, title: @map.title }
      end

      assert_redirected_to map_path(assigns(:map))
    end

    should "show map" do
      get :show, id: @map
      assert_response :success
    end

    should "get edit" do
      get :edit, id: @map
      assert_response :success
    end

    should "update map" do
      patch :update, id: @map, map: { address: @map.address, title: @map.title }
      assert_redirected_to map_path(assigns(:map))
    end

    should "destroy map" do
      assert_difference('map.count', -1) do
        delete :destroy, id: @map
      end

      assert_redirected_to maps_path
    end
   end
end
