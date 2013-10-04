require '../sales_engine/lib/sales_engine'
require 'bigdecimal'

Shoes.app do
  @mr = SalesEngine.new("../sales_engine/data").merchant_repository
  stack(margin: 8) do
    para "Enter a merchant id to see that merchant's name"
    flow do
      @input = edit_line
      @merchant = button "OK"
    end
      @text = para ""
      @merchant.click do
        @text.replace @mr.find_all_by_id(@input.text).first.name
     end
    para "Press OK to see the merchant name with the most items sold"
    flow do
      @input_items = edit_line
      @merchant_items = button "OK"
    end
      @text_items = para ""
      @merchant_items.click do
        @text_items.replace @mr.most_items(@input_items.text.to_i).first.name
     end


  end
end
