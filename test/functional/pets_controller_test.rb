# encoding: utf-8
require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:hatchling)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { blz_id: @pet.blz_id + 10000, category_id: @pet.category_id, description: @pet.description, event: @pet.event, icon_url: @pet.icon_url, nga_url: @pet.nga_url, season: @pet.season, source: @pet.source, status: @pet.status, title_cn: @pet.title_cn, title_en: @pet.title_en, weather: @pet.weather }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should show pet via friendly id" do
    flunk
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    put :update, id: @pet, pet: { blz_id: @pet.blz_id, category_id: @pet.category_id, description: @pet.description, event: @pet.event, icon_url: @pet.icon_url, nga_url: @pet.nga_url, season: @pet.season, source: @pet.source, status: @pet.status, title_cn: @pet.title_cn, title_en: @pet.title_en, weather: @pet.weather }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_redirected_to pets_path
  end

  test "shoud show search results" do
    get :search, q: @pet.title_cn
    assert_response :success
    assert_select "table.table tr", 2
    assert_select "table.table tr:nth-child(2) td:nth-child(2)", @pet.title_cn
  end
end
