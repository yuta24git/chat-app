require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'messageとimageが存在していれば保存できる' do
        expect(@message).to be_valid
      end
      it 'messageが空でも保存できる' do
        @message.message = ""
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'messageとimageが空では保存できない' do
        @message.message = ""
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Message can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end