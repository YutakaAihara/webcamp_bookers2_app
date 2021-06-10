class GroupMessagesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @group_message = GroupMessage.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_message = GroupMessage.new(group_message_params)
    @group_message.group_id = @group.id
    if @group_message.save
      GroupMessageMailer.event(@group_message).deliver_now
      redirect_to group_group_message_path(@group, @group_message)
    end
  end

  def show
    @group_message = GroupMessage.find(params[:id])
  end

  private

  def group_message_params
    params.require(:group_message).permit(:mail_title, :mail_body, :group_id)
  end

end
