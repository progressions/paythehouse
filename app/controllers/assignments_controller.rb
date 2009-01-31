class AssignmentsController < ApplicationController
  before_filter :login_required
  
  def index
    @assignments = Assignment.all
  end
  
  def show
    @assignment = Assignment.find(params[:id])
  end
  
  def new
    @bill = Bill.find(params[:bill])
    @assignment = Assignment.new
    if @bill
      @assignment.amount_in_cents = @bill.amount_in_cents / 2.0
    end
  end
  
  def create
    @assignment = Assignment.new(params[:assignment])
    current_user.assignments << @assignment
    if @assignment.save
      flash[:notice] = "Successfully created assignment."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @assignment = Assignment.find(params[:id])
  end
  
  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      flash[:notice] = "Successfully updated assignment."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    flash[:notice] = "Successfully destroyed assignment."
    redirect_to root_url
  end
end
