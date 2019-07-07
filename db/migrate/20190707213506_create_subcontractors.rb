class CreateSubcontractors < ActiveRecord::Migration
  def change
    create_table :subcontractors do |t|
      t.string :name
      t.string :trade
      t.string :project_name
      t.string :status
      t.string :payment_status
    end
  end
end
