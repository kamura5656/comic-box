require 'rails_helper'

RSpec.describe Box, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @box = FactoryBot.build(:box, user_id: @user.id)
  end

  describe '本棚登録' do
    context '本棚登録ができる時' do
      it 'comic_id,user_idが登録されていれば登録できる' do
        expect(@box).to be_valid
      end
      it 'commentを登録しても登録できる' do
        @box.comment = 'あああああ'
        expect(@box).to be_valid
      end
    end

    context '本棚登録ができない時' do
      it 'comic_idがなければ登録できない' do
        @box.comic_id = ''
        @box.valid?
        expect(@box.errors.full_messages).to include("Comic can't be blank")
      end
      it 'user_idがなければ登録できない' do
        @box.user_id = ''
        @box.valid?
        expect(@box.errors.full_messages).to include("User must exist")
      end
    end
  end
end