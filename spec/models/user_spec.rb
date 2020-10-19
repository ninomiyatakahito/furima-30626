require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録の情報" do
      it "nicknameとemail、passwordとpassword_confirmationとlast_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "encrypted_passwordが空では登録できない" do
        @user.encrypted_password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "first_nameは空でないと保存できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it "last_nameは空では保存できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it "first_name_kanaは空でないと保存できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end



            # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは、@を含む必要があること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end


            # 確認用パスワードが必要であるテスト ▼

      it "重複したpasswordが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.password = @user.password
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end




            # パスワードの文字数テスト ▼
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      
    
       # 名前全角入力のテスト ▼


      it "first_nameは全角でないと保存できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      
      it "last_nameは全角でないと保存できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      
      it "first_name_kanaは全角カタカナでないと保存できない" do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaは全角カタカナでないと保存できない" do
        @user.last_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

    end
  end
end
