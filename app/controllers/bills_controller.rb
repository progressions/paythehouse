class BillsController < ApplicationController
  before_filter :login_required
  
  def index
    @bills = Bill.paginate :page => params[:page], :order => 'created_at DESC'
    @payments = Payment.paginate :page => params[:page], :order => 'created_at DESC'
    @assignments = Assignment.paginate :page => params[:page], :order => 'created_at DESC'
    @entries = @bills + @payments + @assignments
    @entries.sort! {|a,b| a.created_at <=> b.created_at}
  end
  
  def show
    @bill = Bill.find(params[:id])
  end
  
  def new
    @users = User.find(:all)
    @bill = Bill.new
    @users.each do |user|
      @bill.assignments.build(:payee => user)
    end
  end
  
  def create
    raise params.inspect
    @bill = Bill.new(params[:bill])
    current_user.bills << @bill
    if @bill.save
      flash[:notice] = "Successfully created bill."
      redirect_to new_assignment_url(:bill => @bill)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @bill = Bill.find(params[:id])
  end
  
  def update
    @bill = Bill.find(params[:id])
    if @bill.update_attributes(params[:bill])
      flash[:notice] = "Successfully updated bill."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    flash[:notice] = "Successfully destroyed bill."
    redirect_to root_url
  end
end
