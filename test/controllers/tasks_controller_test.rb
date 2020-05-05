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
    
    it "will create a flash alert and redirect for an invalid task" do
      # Act
      get task_path(-1)
      
      # Assert
      expect(flash[:alert]).must_equal "Couldn't find Task with 'id'=-1"
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
    
    it "will create a flash alert and redirect for an invalid task" do
      get edit_task_path(-1)
      expect(flash[:alert]).must_equal "Couldn't find Task with 'id'=-1"
      must_respond_with :redirect
    end
  end
  
  describe "update" do
    before do
      Task.create(
        name: "existing task",  
        description: "existing task description",
        completed_at: nil
      )
    end

    let (:edited_task_hash) {
      {
        task: {
          name: "edited task",
          description: "edited task description",
          completed_at: nil,
        },
      }
    }

    it "can update an existing task" do
      id = Task.first.id

      expect {
        patch task_path(id), params: edited_task_hash
      }.wont_change "Task.count"

      must_respond_with :redirect

      task = Task.find(id)
      expect(task.name).must_equal edited_task_hash[:task][:name]
      expect(task.description).must_equal edited_task_hash[:task][:description]
      expect(task.completed_at).must_be_nil
    end
    
    it "will create a flash alert and redirect for an invalid task" do
      id = -1

      expect {
        patch task_path(id), params: edited_task_hash
      }.wont_change "Task.count"

      expect(flash[:alert]).must_equal "Couldn't find Task with 'id'=-1"

      must_redirect_to root_path
    end
  end
  
  describe "destroy" do
    before do
      Task.create(
        name: "existing task",  
        description: "existing task description",
        completed_at: nil
      )
    end

    it "can delete an existing task" do
      id = Task.first.id

      expect{delete task_path(id)}.must_change "Task.count", 1
    end

    it "will create a flash alert and redirect for an invalid task" do
      id = -1

      expect{delete task_path(id)}.wont_change "Task.count"

      expect(flash[:alert]).must_equal "Couldn't find Task with 'id'=-1"

      must_redirect_to root_path
    end
  end
  
  describe "toggle_complete" do
    before do
      Task.create(
        name: "incomplete task",  
        description: "incomplete task description",
        completed_at: nil
      )
      Task.create(
        name: "completed task",  
        description: "completed description",
        completed_at: Time.now
      )
    end

    let (:completed_task_hash) {
      {
        task: {
          name: "completed task",
          description: "completed task description",
          completed_at: Time.now.to_s,
        },
      }
    }

    it "can mark an incomplete task as complete" do
      id = Task.first.id

      expect { 
        patch toggle_complete_path(id) 
      }.wont_change "Task.count"
      
      task = Task.find(id)
      expect(task.completed_at).must_equal completed_task_hash[:task][:completed_at]
    end

    it "can mark a completed task as incomplete" do
      id = Task.second.id

      expect { 
        patch toggle_complete_path(id) 
      }.wont_change "Task.count"

      task = Task.find(id)
      expect(task.completed_at).must_be_nil
    end

    it "will create a flash alert and redirect for an invalid task" do
      id = -1

      expect { 
        patch toggle_complete_path(id) 
      }.wont_change "Task.count"

      expect(flash[:alert]).must_equal "Couldn't find Task with 'id'=-1"
      
      must_redirect_to root_path
    end
  end
end
