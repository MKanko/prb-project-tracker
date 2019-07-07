class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :type
      t.float :total_cost 
      t.float :sub_cost
      t.string :subcontractors
      t.string :status
      t.string :billing_status 
      t.string :contractor_id
      t.string :subcontractor_id
    end 
  end
end
