class PaymentsController < ApplicationController
  before_filter :login_required
  
  def index
    @payments = Payment.all
  end
  
  def show
    @payment = Payment.find(params[:id])
  end
  
  def new
    amount = params[:amount]
    @payment = current_user.payments.build
    @payment.payee_id = params[:payee_id]
    @payment.amount_in_cents = amount
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
