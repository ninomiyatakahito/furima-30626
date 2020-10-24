require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能がうまくいくとき' do

    it "name, description, category_id, ondition_id, shopping_cost_id, prefecture_id, shopping_days_id, price,imageが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end

  context '商品出品機能がうまくいかないとき' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descripyionが空だと登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it "condition_idが空だと登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end
    it "shopping_cost_idが空だと登録できない" do
      @item.shopping_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping cost can't be blank", "Shopping cost is not a number")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it "shopping_days_idが空だと登録できない" do
      @item.shopping_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping days can't be blank", "Shopping days is not a number")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが¥300未満だと登録できない" do
      @item.price = 30
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "priceが¥9,999,999以上だと登録できない" do
      @item.price = 999999999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "priceが半角数字出ないと登録できない" do
      @item.price = "aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "category_idが0だと登録できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "condition_idが0だと登録できない" do
      @item.condition_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end
    it "shopping_cost_idが0だと登録できない" do
      @item.shopping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping cost must be other than 0")
    end
    it "prefecture_idが0だと登録できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "shopping_days_idが0だと登録できない" do
      @item.shopping_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping days must be other than 0")
    end
  end
end
