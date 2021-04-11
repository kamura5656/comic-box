require 'rails_helper'
RSpec.describe ComicShelf, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @comicshelf = FactoryBot.build(:ComicShelf)
    @comicshelf.user_ids = @user.id
    @comicshelf.image = fixture_file_upload('app/assets/images/202055-removebg-preview.png')
  end
  
  describe '漫画登録' do
    context '漫画登録ができる時' do
      it 'nameとauthorとvolumeが入力されており、画像がついていれば登録できる' do
        expect(@comicshelf).to be_valid
      end
      it 'user_idsが入力されていなくても登録できる' do
        @comicshelf.user_ids = nil
        expect(@comicshelf).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'titleが空では登録できない' do
        @comicshelf.title = ''
        @comicshelf.valid?
        expect(@comicshelf.errors.full_messages).to include("Title can't be blank")
      end
      it 'authorが空では登録できない' do
        @comicshelf.author = ''
        @comicshelf.valid?
        expect(@comicshelf.errors.full_messages).to include("Author can't be blank")
      end
      it 'imageが空では登録できない' do
        @comicshelf.image = nil
        @comicshelf.valid?
        expect(@comicshelf.errors.full_messages).to include("Image can't be blank")
      end
      it 'volumeが空では登録できない' do
        @comicshelf.volume = ''
        @comicshelf.valid?
        expect(@comicshelf.errors.full_messages).to include("Volume can't be blank")
      end
      it 'volumeが半角数字でなければ登録できない' do
        @comicshelf.volume = 'ああああ'
        @comicshelf.valid?
        expect(@comicshelf.errors.full_messages).to include("Volume is not a number")
      end
    end
  end
end
