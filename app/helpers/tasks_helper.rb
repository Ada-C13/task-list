module TasksHelper
  def completed_string(task)
    ", completed at #{task.completed_at}" unless task.completed_at.nil?
  end
end
