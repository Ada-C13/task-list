# for view helpers
# presenters or decorators alternative pattern
module TasksHelper
    def task_classes(task)
        if task.completed_at
            "task completed"
        else
            "task"
        end
    end


end
