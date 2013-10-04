require '../sales_engine/lib/sales_engine'
require 'bigdecimal'

Shoes.app do
  @mr = SalesEngine.new("../sales_engine/data").merchant_repository
  stack(margin: 8) do
    para "Enter a merchant id"
    flow do
      @input = edit_line
      @merchant = button "OK"
    end
      @text = para ""
      @merchant.click do
        @text.replace @mr.find_all_by_id(@input.text).first.name
     end
  end
end
