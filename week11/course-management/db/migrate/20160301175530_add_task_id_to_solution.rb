class AddTaskIdToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :task_id, :integer
  end
end
