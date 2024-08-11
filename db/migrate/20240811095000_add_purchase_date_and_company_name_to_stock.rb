class AddPurchaseDateAndCompanyNameToStock < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :purchase_date, :date, default: -> { 'CURRENT_DATE' }
    add_column :stocks, :company_name, :string
  end
end
