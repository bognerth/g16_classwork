class AddOrderToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :order, :string, :default => 'm'
    add_column :answers, :order, :string, :default => 'm'
  end
end
