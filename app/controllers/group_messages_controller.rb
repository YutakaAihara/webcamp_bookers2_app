class GroupMessagesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @group_message = GroupMessage.new
  end
  
  def create
  end
  
  def show
    @group_message.find(params[:id])
  end
  
  private
  
  def group_message_params
    params.require(:group_message).permit(:name, :message)
  end

end
