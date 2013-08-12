class ChangeColumnStatements < ActiveRecord::Migration
  def change
    rename_column :statements, :type, :inout    
  end
end
