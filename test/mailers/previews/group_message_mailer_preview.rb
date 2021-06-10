# Preview all emails at http://localhost:3000/rails/mailers/group_message_mailer
class GroupMessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/group_message_mailer/event
  def event
    group_message = GroupMessage.second
    GroupMessageMailer.event(group_message)
    
  end

end
