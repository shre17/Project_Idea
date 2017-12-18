class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def idea_notification_to_admin(user,idea)
    @user = user
    @idea = idea
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'New idea has been submitted')
  end

  def idea_notification_to_user(user,idea)
    @user = user
    @idea = idea
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'your idea has been submitted')
  end

 def notification_to_idea_creator(admin, idea_provider, idea)
    @admin = admin
    @idea_provider = idea_provider
    @idea = idea
    # Sending applicants attachment with email to listing creator
    if idea.attachments.present?
      idea.attachments.each do |attachment|
        attachments[File.basename(attachment.attachment_name.to_s)] = File.read(Rails.root.to_s+ "/public"+attachment.attachment_name_url.to_s)
      end
    end
    mail(to: admin.try(:email), subject: "New Requiremrnts for #{idea.idea_title}")
  end


    #  attachments[@idea.idea_attachment.original_filename] = File.read(@idea.idea_attachment.current_path)
    # mail(to: @email, subject: @idea.title, from: @user.email)

# def my_mail(attachment_tmp_path)
#     attachments['attachment'] = File.read(attachment_tmp_path)
#     mail(from: ENV['MY_MAIL'], to: ENV['MAIL_RECIVER'], subject: 'this is subject')
# end

end
