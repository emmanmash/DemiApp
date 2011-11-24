require File.dirname(__FILE__) + '/../test_helper'
require 'st_supervisors_controller'

# Re-raise errors caught by the controller.
class StSupervisorsController; def rescue_action(e) raise e end; end

class StSupervisorsControllerTest < Test::Unit::TestCase
  fixtures :st_supervisors

  def setup
    @controller = StSupervisorsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:st_supervisors)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:st_supervisors)
    assert assigns(:st_supervisors).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:st_supervisors)
  end

  def test_create
    num_st_supervisors = StSupervisors.count

    post :create, :st_supervisors => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_st_supervisors + 1, StSupervisors.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:st_supervisors)
    assert assigns(:st_supervisors).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil StSupervisors.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      StSupervisors.find(1)
    }
  end
end
