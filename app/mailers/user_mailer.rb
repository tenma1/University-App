class UserMailer < ApplicationMailer
  default from: email_address_with_name('tenma.aterno.at.007@gmail.com', 'Arpit Purohit')

    # def welcome_email
    #   @user = params[:user]
    #   mail(to: email_address_with_name(@user.email, @user.name),subject: 'Welcome to My Awesome Site')
    # end

    def welcome_mail(user)
      @user = user
      @url  = 'http://example.com/login'
      attachments.inline['University.jpg'] = File.read('/home/rails-16/rails_work/demo_admin/app/assets/images/University.jpg')
      mail(to: email_address_with_name(@user.email, @user.name),subject: "Welcome To University_App")
    end
end
