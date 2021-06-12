require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end



describe 'ユーザー新規登録' do

  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation,name_reading_last,name_reading_first,birthday が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

 

  context '新規登録できないとき' do

  
  
  it 'emailが空だと登録できない' do
    @user.email=''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end


  it 'メールアドレスに@を含まないと登録できない' do
    @user.email='abcdef.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  

  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 


  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end



   it 'passwordは英数字混合でないと登録できない' do
    @user.password = "も７６７７７"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  
   end


    it 'nicknameが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end


    it 'name_lastが空だと登録できない' do
      @user.name_last = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name last can't be blank")
    end

    it 'name_firstが空だと登録できない' do
      @user.name_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name first can't be blank")
    end



    it 'name_lastは全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
      @user.name_last = "eo7777"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last is invalid")
     end
  
   
     it 'name_firstは全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
      @user.name_first = "tt7779"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first is invalid")
     end
  
      it 'name_reading_lastが空だと登録できない'do
      @user.name_reading_last = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name reading last is invalid")
    end


    it 'name_reading_firstが空だと登録できない'do
      @user.name_reading_first= ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name reading first is invalid")
    end


      it 'name_reading_lastは全角（カタカナ）での入力でないと登録できない'do
      @user.name_reading_last="えo7777"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading last is invalid")
     end
  

     it 'name_reading_firstは全角（カタカナ）での入力でないと登録できない' do
      @user.name_reading_first="もt7779"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading first is invalid")
     end




    it 'birthdayが空だと登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end




  it 'passwordが存在してもpassword_confirmationが空では登録できない' do

    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
 


  

end
end
end