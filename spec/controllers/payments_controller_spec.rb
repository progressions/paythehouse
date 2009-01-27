require File.dirname(__FILE__) + '/../spec_helper'
 
describe PaymentsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Payment.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Payment.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Payment.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(payment_url(assigns[:payment]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Payment.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Payment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Payment.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Payment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Payment.first
    response.should redirect_to(payment_url(assigns[:payment]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    payment = Payment.first
    delete :destroy, :id => payment
    response.should redirect_to(payments_url)
    Payment.exists?(payment.id).should be_false
  end
end
