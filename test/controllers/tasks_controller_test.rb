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
  
  # Unskip these tests for Wave 2
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
  
  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do
      # Act
      get edit_task_path(task.id)
      # Assert
      must_respond_with :success
    end
    
    it "will respond with not found when attempting to edit a nonexistant task" do
      # Act
      get edit_task_path(-1)
      # Assert
      must_respond_with :not_found
    end
  end
  
  # Uncomment and complete these tests for Wave 3
  describe "update" do
    before do
      Task.create(name: "New task", description: "this is another example for a test")
      @params_hash = {
        task: {
          name: "Drink water",
          description: "stay hydrated"
        }
      }
    end
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    #        thing to test.
    it "can update an existing task" do
      daily_task = Task.first
      expect{
        patch task_path(daily_task.id), params: @params_hash
      }.must_differ "Task.count", 0

      must_redirect_to task_path(daily_task.id)
      expect(Task.first.name).must_equal @params_hash[:task][:name]
      expect(Task.first.description).must_equal @params_hash[:task][:description]
    end
    
    it "will respond with not found if given an invalid id" do
      expect{
        patch task_path(-1), params: @params_hash
      }.wont_change "Task.count"

      must_respond_with :not_found
    end
  end
  
  # Complete these tests for Wave 4
  describe "destroy" do
    before do
      Task.create(name: "New task", description: "this is another example for a test")
    end

    it "can delete a task and redirect to root path" do
      task1 = Task.first
      expect {
        delete task_path(task1.id)
      }.must_differ "Task.count", -1

      must_redirect_to root_path
    end

    it "will respond with not_found if given an invalid id" do
      expect {
        delete task_path(-1)
      }.wont_change "Task.count"

      must_respond_with :not_found
    end
  end
  
  # Complete for Wave 4
  describe "toggle_complete" do
    before do
      Task.create(name: "New task", description: "this is another example for a test")
    end

    it "can mark a task complete and redirect to root path" do
      daily_task = Task.first
      patch complete_task_path(daily_task.id)
      expect(Task.first.completed_at).wont_be_nil

      must_redirect_to root_path
    end

    it "can unmark a task to incomplete and redirect to root path" do
      daily_task = Task.first
      patch complete_task_path(daily_task.id)
      patch complete_task_path(daily_task.id)
      expect(Task.first.completed_at).must_be_nil

      must_redirect_to root_path
    end

    it "will respond with not_found if given an invalid id" do
      expect {
        patch complete_task_path(-1)
      }.wont_change "Task.count"
      
      must_respond_with :not_found
    end
  end
end
