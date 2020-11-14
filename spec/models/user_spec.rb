require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームに関するテストコード
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが9文字以上であれば登録できない" do
      user = build(:user, nickname: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は8文字以内で入力してください")
    end

    it "nicknameが8文字以下では登録できる" do
      user = build(:user, nickname: "aaaaaaaa")
      expect(user).to be_valid
    end

    # emailに関するテストコード
    it "emailがない場合は登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    # passwordに関するテストコード
    it "passwordがない場合は登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it " passwordが8文字以上であれば登録できる" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      expect(user).to be_valid
    end

    it " passwordが7文字以下であれば登録できない" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上に設定して下さい。")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end