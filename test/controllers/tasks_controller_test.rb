require "test_helper"


describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
    completed_at: Time.now + 5.days
  }

  let (:task_2) {
    Task.create name: "sample task 2", description: "this is an example for a test",
    completed_at: nil
  }
  
  # Tests for Wave 1
  describe "index action" do
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
  describe "show action" do
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
      must_redirect_to root_path
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
  

  describe "create action" do
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
      }.must_differ "Task.count", 1
      
      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed_at).must_equal task_hash[:task][:completed_at]
      
      must_respond_with :redirect
      must_redirect_to task_path(new_task.id)
    end
  end
  

  # Unskip and complete these tests for Wave 3
  describe "edit action" do
    it "can get the edit page for an existing task" do

      # Your code here
      # Act 
      get edit_task_path(task.id)

      # Assert 
      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      # Your code here
      # Act 
      get edit_task_path(-1)

      # Assert 
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end
  

  # Uncomment and complete these tests for Wave 3
  describe "update action" do
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    # thing to test.

    before do
      Task.create(name: "Taking a nap", description: "Cat nap is awesome")
    end

    let (:new_task_hash) {
      {
        task: {
          name: "paddling boarding",
          description: "let's go paddle boarding",
          completed_at: nil
        },
      }
    }

    it "can update an existing task" do
      # Your code here

      id = Task.first.id 

      expect {
        patch task_path(id), params: new_task_hash
      }.wont_change "Task.count"

      must_respond_with :redirect

      updated_task = Task.find_by(id: id)
      expect(updated_task.name).must_equal new_task_hash[:task][:name]
      expect(updated_task.description).must_equal new_task_hash[:task][:description]
      expect(updated_task.completed_at).must_equal new_task_hash[:task][:completed_at]
    end 


    it "will not update an existing task if there is no params change" do
      task_id = task_2.id
      
      expect {
        patch task_path(task_id), params: {}
      }.must_raise 

      not_updated_task = Task.find_by(id: task_id)

      expect(not_updated_task.name).must_equal task_2[:name]
      expect(not_updated_task.description).must_equal task_2[:description]
      expect(not_updated_task.completed_at).must_equal task_2[:completed_at]
    end  


    it "will redirect to the root page if given an invalid id" do
      # Your code here
      id = -1 

      expect {
        patch task_path(id), params: new_task_hash
      }.wont_change "Task.count"

      must_redirect_to root_path
    end  
  end


  # reference: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/destroy-action.md
  # Complete these tests for Wave 4
  describe "destroy action" do
    # Your tests go here
    it "can destroy a model" do 

      # create and save
      temp_task = Task.create(name: "Traveling", description: "Santiago travel")

      id = temp_task.id 

      # Act & Assert
      expect {
        delete task_path(id)
      }.must_change 'Task.count', -1

      temp_task = Task.find_by(id: id)

      expect(temp_task).must_be_nil 

      must_respond_with :redirect 
      must_redirect_to tasks_path
    end


    it "will redirect to the tasks_path if given an invalid id" do
      # Your code here
      id = -1 

      expect {
        delete task_path(id)
      }.wont_change "Task.count"

      must_respond_with :redirect
      must_redirect_to root_path 
    end  
  end
  

  # Complete for Wave 4
  describe "complete action" do
    # Your tests go here

    before do
      @last_task = Task.create(name: "last task", description: "Santiago travel")
    end

    let (:new_task_hash) {
      {
        task: {
          name: "last task",
          description: "Santiago travel",
        },
      }
    }

    let (:completed_task_hash) {
      {
        task: {
          name: "completed task",
          description: "completed!!!",
          completed_at: Time.now,
        },
      }
    }


    it "can mark a task as completed" do 

      expect {
        patch complete_task_path(@last_task.id), params: new_task_hash
      }.wont_change "Task.count"


      last_task = Task.find_by(id: @last_task.id)

      expect(last_task.name).must_equal new_task_hash[:task][:name]
      expect(last_task.description).must_equal new_task_hash[:task][:description]
      expect(last_task.completed_at).must_be_kind_of String

      must_respond_with :redirect 
      must_redirect_to tasks_path
    end


    it "can mark a task as not completed" do 

      @last_task.update(completed_at: Time.now) # mark as complete

      expect {
        patch complete_task_path(@last_task.id), params: new_task_hash  # mark as incomplete
      }.wont_change "Task.count"


      not_complete_task = Task.find_by(id: @last_task.id)

      expect(not_complete_task.name).must_equal new_task_hash[:task][:name]
      expect(not_complete_task.description).must_equal new_task_hash[:task][:description]
      expect(not_complete_task.completed_at).must_be_nil

      must_respond_with :redirect 
      must_redirect_to tasks_path
    end


    it "will redirect to the tasks_path if given an invalid id" do
      # Your code here
      id = -1 

      expect {
        patch complete_task_path(id), params: new_task_hash 
      }.wont_change "Task.count"

      must_respond_with :redirect
      must_redirect_to root_path 
    end  
  end
end
