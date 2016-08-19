class AddTargetToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :target, :string
  end
end
