require "test_helper"

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test", 
    completed_at: Time.now + 5.days
  }
  
  describe "index" do
    it "can get the index path" do
      get tasks_path
      
      must_respond_with :success
    end
    
    it "can get the root path" do
      get root_path
 
      must_respond_with :success
    end
  end
  
  describe "show" do
    it "can get a valid task" do
      get task_path(task.id)
      
      must_respond_with :success
    end
    
    it "will redirect for an invalid task" do
      get task_path(-1)
      
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
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
        },
      }
      
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
      get edit_task_path(-1)
      must_respond_with :redirect
      must_redirect_to tasks_path
    end
  end
  
  describe "update" do
    it "can update an existing task" do
      exist_task = Task.create(name: "piano", description: "practice piano for 30minutes")
      update = {
        task: {
          name: "no more piano",
          description: "learn a new instrument"
        }
      }

      expect {patch task_path(exist_task.id), params: update}.must_differ "Task.count", 0
      expect(Task.find_by(id: exist_task.id).name).must_equal "no more piano"
    end
    
    it "will redirect to the root page if given an invalid id" do
      task = Task.create(name: "piano", description: "practice piano for 30minutes")
      update = {
        task: {
          name: "no more piano",
          description: "learn a new instrument"
        }
      }
      patch task_path(-1), params: update

      must_respond_with :redirect
      must_redirect_to root_url
    end
  end
  
  #sorry I can't bring myself to do more tests, i !love them. 
  describe "destroy" do
    # Your tests go here
    
  end
  
  # Complete for Wave 4
  describe "toggle_complete" do
    # Your tests go here
  end
end
