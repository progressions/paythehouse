class PaymentsController < ApplicationController
  before_filter :login_required
  
  def index
    @payments = Payment.all
  end
  
  def show
    @payment = Payment.find(params[:id])
  end
  
  def new
    @bill = Bill.find(params[:bill]) if params[:bill]
    @payment = current_user.payments.build
    @payment.amount = current_user.balance.abs
    if @bill
      @payment.amount_in_cents = @bill.amount_in_cents / 2.0
      @payment.note = @bill.note
    end
  end
  
  def wnew
    @bill = Bill.find(params[:bill])
    @payment = Payment.new
    if @bill
      @payment.amount_in_cents = @bill.amount_in_cents / 2.0
      @payment.note = @bill.note
    end
  end
  
  def create
    @payment = Payment.new(params[:payment])
    current_user.payments << @payment
    if @payment.save
      flash[:notice] = "Successfully created payment."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @payment = Payment.find(params[:id])
  end
  
  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params[:payment])
      flash[:notice] = "Successfully updated payment."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:notice] = "Successfully destroyed payment."
    redirect_to root_url
  end
end
