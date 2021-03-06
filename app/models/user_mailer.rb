class UserMailer < ActionMailer::Base
  def payment_received_notification(payment)
    setup_email(payment.payee)
    @subject << 'You have received a payment'
    @body[:payment] = payment
    @body[:url] = APP_CONFIG[:site_url]
  end
  
  def payment_made_notification(payment)
    setup_email(payment.user)
    @subject << 'You have made a payment'
    @body[:payment] = payment
    @body[:url] = APP_CONFIG[:site_url]
  end
  
  def assignment_notification(assignment)
    setup_email(assignment.payee)
    @subject << 'You have been assigned a bill'
    @body[:assignment] = assignment
    @body[:users] = User.find(:all)
    @body[:url] = APP_CONFIG[:site_url]
    content_type "text/html"
  end
  
  def bill_notification(bill)
    setup_email(bill.user)
    @subject << 'You have created a bill'
    @body[:bill] = bill
    @body[:url] = APP_CONFIG[:site_url]
  end
  
  def signup_notification(user)
    setup_email(user)
    @subject << 'Please activate your new account'
    @body[:url] = "#{APP_CONFIG[:site_url]}/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject << 'Your account has been activated!'
    @body[:url] = APP_CONFIG[:site_url]
  end
  
  protected
  
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = APP_CONFIG[:admin_email]
    @subject = "[#{APP_CONFIG[:site_name]}] "
    @sent_on = Time.now
    @body[:user] = user
  end
end
