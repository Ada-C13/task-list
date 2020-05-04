require "test_helper"
require 'pry'

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
      get new_task_path
      
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
      # post tasks_path, params: task_hash
     expect {
       post tasks_path, params: task_hash
     }.must_change "Task.count", 1
      
      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed_at).must_equal task_hash[:task][:completed_at]
      
      must_respond_with :redirect
      must_redirect_to task_path(new_task)
    end
  end
  
  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do
      get edit_task_path(task)

      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      get edit_task_path(-1)
      
      must_respond_with :redirect
    end
  end
  
  # Uncomment and complete these tests for Wave 3
  describe "update" do
    it "can update an existing task" do
      task_one = Task.create name: 'task 1', description: 'the first one', completed_at: nil
    
      task_hash = {
        task: {
          name: "updated task",
          description: "updated task description",
          completed_at: nil,
        },
      }
   
      expect {
        patch task_path(task_one), params: task_hash
      }.wont_change "Task.count"

      updated_task = Task.find_by(id: task_one.id)

      expect(updated_task.name).must_equal task_hash[:task][:name]
      expect(updated_task.description).must_equal task_hash[:task][:description]
      expect(updated_task.completed_at).must_equal task_hash[:task][:completed_at]
    end
    
    it "will redirect if given an invalid id" do
      patch task_path(-10)

      must_respond_with :redirect
    end
  end
  
  # Complete these tests for Wave 4
  describe "destroy" do
    it 'destroys a task from the database' do
    
      task_to_delete = Task.create(name: 'task to delete', description: 'this is meant to be deleted', completed_at: nil)
      
      expect {
        delete task_path(task_to_delete)
      }.must_differ "Task.count", -1
    end 

    it 'redirects if given invalid id' do
      delete task_path(-10)

      must_respond_with :redirect
    end
  end
  
  # Complete for Wave 4
  describe "toggle_complete" do
    it 'marks tasks as complete' do
      task_to_mark = Task.create(name: "we already did this one", description: "a task to mark right away", completed_at: nil)
      
      patch mark_complete_path(task_to_mark)
      
      task_to_mark.reload
      expect(task_to_mark.completed_at).wont_be_nil
        
    end
  end

  describe "toggle_incomplete" do
    it 'marks tasks as incomplete' do
      task_to_unmark = Task.create(name: "oops we didn't do this yet", description: "so let's unmark this task", completed_at: Time.now)
      
      patch mark_incomplete_path(task_to_unmark)
      
      task_to_unmark.reload
      expect(task_to_unmark.completed_at).must_be_nil
    end
  end
end
