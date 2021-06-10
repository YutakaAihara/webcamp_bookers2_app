class GroupMessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_message_mailer.event.subject
  #
  def event(group_message)
    @group_message = group_message
    mail(to: @group_message.group.users.pluck(:email), subject: 'グループからの連絡')
  end
end
