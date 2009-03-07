class BillsController < ApplicationController
  before_filter :login_required
  
  def index
    @users = User.find(:all)
    @bills = Bill.paginate :page => params[:page], :order => 'created_at DESC'
    @payments = Payment.paginate :page => params[:page], :order => 'created_at DESC'
    @assignments = Assignment.paginate :page => params[:page], :order => 'created_at DESC'
    @entries = @bills + @payments + @assignments
    @entries.sort! {|a,b| b.created_at <=> a.created_at}
  end
  
  def show
    @bill = Bill.find(params[:id])
  end
  
  def new
    @users = User.find(:all)
    @bill = Bill.new
    @users.each do |user|
      @bill.assignments.build(:payee_id => user.id, :user_id => current_user.id)
    end
  end
  
  def create
    @bill = Bill.new(params[:bill])
    unless @bill.date
      @bill.date = 2.weeks.from_now
    end
    current_user.bills << @bill
    if @bill.save
      @bill.assignments.each do |assignment|
        UserMailer.deliver_assignment_notification(assignment)
      end
      flash[:notice] = "Successfully created bill."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @users = User.find(:all)
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
