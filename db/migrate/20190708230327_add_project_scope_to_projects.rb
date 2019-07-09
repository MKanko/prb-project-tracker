class AddProjectScopeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_scope, :string 
  end
end
