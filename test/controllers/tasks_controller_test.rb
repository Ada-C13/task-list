require "test_helper"

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
    completed_at: Time.now + 5.days
  }
  
  # Tests for Wave 1
  describe "index" do
    it "can get the index path" do
      # Act
      get tasks_path
      
      # Assert
      must_respond_with :success
    end
    
    it "can get the root path" do
      # Act
      get root_path
      
      # Assert
      must_respond_with :success
    end
  end
  
  describe "show" do
    it "can get a valid task" do
      # Act
      get task_path(task.id)
      
      # Assert
      must_respond_with :success
    end
    
    it "will redirect for an invalid task" do
      # Act
      get task_path(-1)
      
      # Assert
      must_respond_with :redirect
    end
  end
  
  describe "new" do
    it "can get the new task page" do
      # Act
      get new_task_path
      
      # Assert
      must_respond_with :success
    end
  end
  
  describe "create" do
    it "can create a new task" do
      # Arrange
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed_at: nil,
        },
      }
      
      # Act-Assert
      expect {
        post tasks_path, params: task_hash
      }.must_change "Task.count", 1
      
      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed_at).must_equal task_hash[:task][:completed_at]
      
      must_respond_with :redirect
      must_redirect_to task_path(new_task.id)
    end
  end
  
  describe "edit" do
    let (:task) {
      Task.create name: "sample task", description: "this is an example for a test",
      completed_at: Time.now + 5.days
    }
    
    it "can get the edit page for an existing task" do
      # Act
      get edit_task_path(task.id)
      
      # Assert
      must_respond_with :success
      
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      # Arrange 
      invalid_id = -1

      # Act
      get task_path(invalid_id)
      
      # Assert
      must_redirect_to root_path
    end
  end
  
  describe "update" do
    before do
      Task.create(name: "existing task", description: "this is an example task", completed_at: nil)
    end

    let(:task_hash){
      {
        task: {
          name: "existing task is now updated",
          description: "new task description is also updated",
          completed_at: nil,
        },
      }
    }

    it "can update an existing task for valid id" do
      # Arrange
      existing_task = Task.first

      # Act-Assert
      # no tasks should be added or deleted when updating
      expect {
        patch task_path(existing_task.id), params: task_hash
      }.wont_change "Task.count"
      
      # app should take the user back to the task's show page after the task is updated
      must_respond_with :redirect
      must_redirect_to task_path(existing_task.id)

      # update local variable to reflect values in DB
      existing_task.reload 

      # values do change
      expect(existing_task.name).must_equal task_hash[:task][:name]
      expect(existing_task.description).must_equal task_hash[:task][:description]
    end
    
  
    it "will not update if the params are invalid" do
      # Arrange
      invalid_id = -1

      # Act - Assert
      expect {
        patch task_path(invalid_id), params: task_hash
      }.wont_change "Task.count"
  
      must_respond_with :not_found
    end
  end
  

  describe "destroy" do
    before do
      Task.create(name: "existing task", description: "this is an example task", completed_at: nil)
    end

    it "can delete an existing task" do
      # Arrange
      existing_task = Task.first

      # Act-Assert
      # task database should go down by one
      expect {
        delete task_path(existing_task.id)
      }.must_change "Task.count", -1
      
      # app should refresh home page once a task has been deleted
      must_respond_with :redirect
      must_redirect_to root_path
    end

    it "will not delete anything if invalid id is given" do
      # Arrange
      invalid_id = -1

      # Act - Assert
      expect {
        delete task_path(invalid_id)
      }.wont_change "Task.count"
  
      # app should return to home page
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  describe "mark_complete" do
    before do
      Task.create(name: "existing task", description: "this is an example task", completed_at: nil)
    end

    it "can update the completed_at field of an existing task" do
      # Arrange
      existing_task = Task.first

      # Note: this might cause test to fail if there's a second delay
      current_time = Time.now().to_s

      task_hash = {
        task: {
          # not changing name or description
          completed_at: current_time,
        },
      }

      # Act-Assert
      # no tasks should be added or deleted when marking complete
      expect {
        patch mark_path(existing_task.id), params: task_hash
      }.wont_change "Task.count"
      
      # app should refresh home page once a task has been marked complete
      must_respond_with :redirect
      must_redirect_to root_path

      # update local variable to reflect values in DB
      existing_task.reload 

      # task name and description don't change, but completed_at does
      expect(existing_task.name).must_equal "existing task"
      expect(existing_task.description).must_equal "this is an example task"
      expect(existing_task.completed_at).must_equal task_hash[:task][:completed_at]
    end
    
  
    it "will return error if invalid id is given" do
      # Arrange
      invalid_id = -1

      current_time = Time.now().to_s

      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed_at: current_time,
        },
      }

      # Act - Assert 
      expect {
        patch mark_path(invalid_id), params: task_hash
      }.wont_change "Task.count"
  
      must_respond_with :not_found
    end
  end

end
