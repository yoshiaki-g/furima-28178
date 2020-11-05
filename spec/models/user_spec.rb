require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録機能' do
    context '新規登録がうまくいくとき' do
      it "name,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nameは空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailは空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは一意性である" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含む必要がある" do
        @user.password = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは6文字以上でないと登録できない" do
        @user.password = "0000a0"
        @user.password_confirmation = "0000a0"
        expect(@user).to be_valid
      end
      it "passwordは半角英数字でないと登録できない" do
        @user.password = "Ａbenjvj2"
        @user.password_confirmation = "Ａbenjvj2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordは2回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは数字のみの場合は登録できない" do
        @user.password = "12345678"
        @user.password_confirmation = "12345678"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordは半角英字のみの場合は登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "ユーザー本名は、名字がないと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名は、名前がないと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.family_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "ユーザー本名の名字のフリガナがないと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー本名の名前のフリガナがないと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名の名字のフリガナは、全角（カタカナ）での入力がないと登録できない" do
        @user.family_name_kana = "ｱﾍﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
      end
      it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力がないと登録できない" do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "生年月日の入力がないと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
