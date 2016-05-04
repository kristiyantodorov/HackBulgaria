Class AddLectureIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :lecture_id, :integer
  end
end
