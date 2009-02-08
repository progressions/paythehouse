require File.dirname(__FILE__) + '/../spec_helper'
 
describe AssignmentsController do
  fixtures :all
  integrate_views
=begin  
  it "index action should render index template" do
    get :index
    response.should render_template "assignments/index"
  end
  
  it "show action should render show template" do
    get :show, :id => Assignment.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Assignment.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Assignment.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(assignment_url(assigns[:assignment]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Assignment.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Assignment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Assignment.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Assignment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Assignment.first
    response.should redirect_to(assignment_url(assigns[:assignment]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    assignment = Assignment.first
    delete :destroy, :id => assignment
    response.should redirect_to(assignments_url)
    Assignment.exists?(assignment.id).should be_false
  end
=end
end
