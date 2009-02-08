require File.dirname(__FILE__) + '/../spec_helper'
 
describe BillsController do
  fixtures :all
  integrate_views
  
  def stub_current_user(admin = false, options = {}, role = "Normal")
      
    @current_user = mock_model(User, {:id => 1, :name => 'Bill Smith', :email => 'me@privacy.net', :admin => admin, :is_an_admin? => admin, :balance => "$35.50",
        :login => 'bill', :sent_messages_count => 0,
        :remember_me => nil,:login_key => '123456',:login_key_expires_at => Time.now,
        :valid? => true, :save => nil, :new? => false }.merge(options))
  end
  
  
  def stub_current_signed_in_user(admin = false, options ={})
    #stub_current_user
    @current_user = users(:quentin)
    controller.stub!(:current_user).and_return(@current_user)
    controller.stub!(:signed_in?).and_return(true)
  end
  
  before(:each) do
    stub_current_signed_in_user
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Bill.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Bill.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
=begin  
  
  it "create action should redirect when model is valid" do
    Bill.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(root_url)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Bill.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Bill.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bill.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Bill.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bill.first
    response.should redirect_to(root_url)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    bill = Bill.first
    delete :destroy, :id => bill
    response.should redirect_to(root_url)
    Bill.exists?(bill.id).should be_false
  end
=end
end
