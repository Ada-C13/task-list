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
      get tasks_path
      
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

    it "will add a new task to a database" do
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed_at: nil,
        },
      }
      
      expect{ post tasks_path, params: task_hash }.must_differ "Task.count", 1
    end
  end
  
  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do
      # Your code here
      Task.create(name: "Task 100", description: "new test task description")

      task = Task.first
      get edit_task_path(task.id)
      
      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      # Your code here
      get edit_task_path(-1)
      
      must_respond_with :redirect
    end
  end
  
  # Uncomment and complete these tests for Wave 3
  describe "update" do
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    #        thing to test.
    it "can update an existing task" do
      # Your code here
      new_task = Task.create(name: "Task 100", description: "new test task description")
      task_hash = {
        task: {
          name: "new task",
          description: "test description"
        },
      }
      
      expect {
      patch task_path(new_task.id), params: task_hash
      }.must_differ 'Task.count', 0
      
      must_redirect_to task_path
      expect(Task.last.name).must_equal task_hash[:task][:name]
      expect(Task.last.description).must_equal task_hash[:task][:description]
    end
    
    it "will redirect to the root page if given an invalid id" do
      # Your code here
      task_hash = {
        task: {
          name: "new task",
          description: "test description"
        },
      }

      patch task_path(-1), params: task_hash
      must_redirect_to root_path
    end
  end
  
  # Complete these tests for Wave 4
  describe "destroy" do
    # Your tests go here
    it "can delete an existing task" do
    new_task = Task.create(name: "Task 100", description: "new test task description")
  
    expect {
      delete task_path(new_task.id)
      }.must_differ 'Task.count', -1
    absent = Task.find_by(id: new_task.id)
    expect(absent).must_be_nil
    end

    it "will redirect to the root page if given an invalid id" do
      delete task_path(-1)
      must_redirect_to root_path
    end    
  end
  
  # Complete for Wave 4
  describe "mark_complete" do
    # Your tests go here
    it "shows a date of completion if marked complete" do

    end
  end
end
