require "test_helper"

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
    completed_at: Time.now + 5.days
  }
  

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
      get task_path(9999)
      
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
    it "can get the edit page for an existing task" do

      get edit_task_path(task.id)

      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      get edit_task_path(9999)

      must_respond_with :redirect
    end
  end
  

  describe "update" do

    it "can update an existing task and redirect to task show page" do

      Task.create(name: "water the air plants", description: "or they will die")

      # Arrange
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed_at: nil,
        },
      }
      
      # Act-Assert

      task = Task.first 

      expect {
        patch task_path(task.id), params: task_hash
      }.must_differ "Task.count", 0
      

      expect(Task.last.name).must_equal task_hash[:task][:name]
      expect(Task.last.description).must_equal task_hash[:task][:description]
      must_redirect_to task_path(task.id)

    end
    
    it "will redirect to the root page if given an invalid id" do
      Task.create(name: "water the air plants", description: "or they will die")

      # Arrange
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed_at: nil,
        },
      }
      
      # Act-Assert

      task = Task.first 

      expect {
        patch task_path(-1), params: task_hash
      }.must_differ "Task.count", 0
      
      must_respond_with :not_found

    end
  end
  

  describe "destroy" do
    # Your tests go here
    
  end
  

  describe "toggle_complete" do
    # Your tests go here
  end
end
