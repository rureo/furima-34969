RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
# 省略


describe'ユーザー新規登録'　do

  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation,name_last_reading, name_first_reading,birthday が存在すれば登録できる' do
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

  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 


  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
   end



   it "passwordは英数字混合でないと登録できない" do
    @user.password = "も７６７７７"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
   end


    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end


    it "name_lastが空だと登録できない" do
      @user.name_last = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name_last can't be blank")
    end

    it "name_firstが空だと登録できない" do
      @user.name_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name_first can't be blank")
    end



    it "name_lastは全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.name_last = "eo7777"
      @user.valid?
      expect(@user.errors.full_messages).to include("name_lastは全角（漢字・ひらがな・カタカナ）で入力してください")
     end
  
     it "name_firstは全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.name_first = "tt7779"
      @user.valid?
      expect(@user.errors.full_messages).to include("name_firstは全角（漢字・ひらがな・カタカナ）で入力してください")
     end
  

     
     it "name_last_readingが空だと登録できない" do
      @user.name_last_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name_last_reading can't be blank")
    end

    it "name_first_readingが空だと登録できない" do
      @user.name_first_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name_first_reading can't be blank")
    end


      it "name_last_readingは全角（カタカナ）での入力でないと登録できない" do
      @user.name_last_reading = "えo7777"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_last_readingは全角（漢字・ひらがな・カタカナ）で入力してください")
     end
  
     it "name_first_readingは全角（カタカナ）での入力でないと登録できない" do
      @user.name_first_reading = "もt7779"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_first_readingは全角（漢字・ひらがな・カタカナ）で入力してください")
     end












    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end




  it 'passwordが存在してもpassword_confirmationが空では登録できない' do

    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  passwordが空では登録できない





end
end
end