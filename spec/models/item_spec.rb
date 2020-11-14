require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は登録が出来ない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "quantityがない場合は登録が出来ない" do
      item = build(:item, quantity: nil)
      item.valid?
      expect(item.errors[:quantity]).to include("を入力してください")
    end

    it "quantityの入力が0未満の場合は登録が出来ない" do
      item = build(:item, quantity: -5)
      item.valid?
      expect(item.errors[:quantity]).to include("は0以上の値にしてください")
    end

    it "quantityの入力が9999を超える場合は登録が出来ない" do
      item = build(:item, quantity: 10000)
      item.valid?
      expect(item.errors[:quantity]).to include("は9999以下の値にしてください")
    end
    
  end
end
