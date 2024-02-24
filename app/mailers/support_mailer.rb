class SupportMailer < ApplicationMailer

  def user_support_request_email
    @email = params[:support][:email]
    attachments.inline['Q_Flower.svg'] = File.read('app/assets/images/Q_Flower.svg')
    mail(to: @email, subject: "Ваше обращение в поддержку принято")
  end

  def admin_support_request_email
    @email = params[:support][:email]
    @comment = params[:support][:comment]
    mail(to: "admin@test.com", subject: "Новое обращение в поддержку")
  end

end

