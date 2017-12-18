require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '48h' do
# system 'bundle exec rake email:email_scheduler'
end 