class AddPlanToUser < ActiveRecord::Migration
  def change
    #add_column is what we are doing...to the :users table...plan_id is the name of the column...integer is the data type 
    #schema.rb shows layouts of tables in our database!
    add_column :users, :plan_id, :integer
  end
end
