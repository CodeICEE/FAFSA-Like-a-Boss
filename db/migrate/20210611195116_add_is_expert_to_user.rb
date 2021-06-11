class AddIsExpertToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_expert, :boolean, default: false
  end
end
