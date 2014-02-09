class AddOrderToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :order, :string, :default => 'o'
    add_column :answers, :order, :string, :default => 'o'
  end
end
