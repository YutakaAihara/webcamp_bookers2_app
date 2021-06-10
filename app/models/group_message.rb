class GroupMessage < ApplicationRecord
  
def new
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
