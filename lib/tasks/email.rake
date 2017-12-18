namespace :email do
  desc "This Task is to send email to user"
  task email_scheduler: :environment do
    Idea.last(2).each do |idea|
      UserMailer.idea_notification_to_user(idea.user, idea).deliver_now
    end
  end
end
