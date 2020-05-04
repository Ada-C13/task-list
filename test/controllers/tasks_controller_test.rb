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
      #skip
      # Act
      get task_path(task.id)
      
      # Assert
      must_respond_with :success
    end
    
    it "will redirect for an invalid task" do
      #skip
      # Act
      get task_path(-1)
      
      # Assert
      must_respond_with :redirect
    end
  end
  
  describe "new" do
    it "can get the new task page" do
      #skip
      
      # Act
      get new_task_path
      
      # Assert
      must_respond_with :success
    end
  end
  
  describe "create" do
    it "can create a new task" do
      #skip
      
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
    before do
      @task = Task.create(name: 'Spring cleaning', description: 'Time to clean up!')
    end

    it "can get the edit page for an existing task" do
      #skip
      # Your code here
      # Arrange 
      valid_task_id = @task.id

      # Act 
      get edit_task_path(valid_task_id)

      # Assert
      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant task" do
      #skip
      # Your code here
      # Arrange
      invalid_task_id = -1

      # Act 
      get edit_task_path(invalid_task_id)

      # Assert
      # redirecting to root page with notice of task not found
      must_redirect_to root_path
    end
  end
  
  # Uncomment and complete these tests for Wave 3
  describe "update" do
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    #        thing to test.
    before do
      Task.create(name: "Walk the dogs", description: "Remember to bring the water for the dogs!", completed_at: nil)
    end

    let (:new_task_hash) {
      {task: {
          name: "Walk the dogs and take the trash out",
          description: "Remember to bring trash out on the way!",
      }
    }}
    
    it "can update an existing task" do
      # Your code here
      task = Task.first

      expect{patch task_path(task.id), params: new_task_hash}.wont_change 'Task.count'
      
      #the site should take the user back to the task's show page after the task is updated
      must_redirect_to task_path(task.id)

      task.reload

      expect(task.name).must_equal new_task_hash[:task][:name]
      expect(task.description).must_equal new_task_hash[:task][:description]
      expect(task.completed_at).must_equal new_task_hash[:task][:completed_at]
    end
    
    it "will redirect to the root page if given an invalid id" do
      # Your code here
      invalid_id = 10000000

      expect{patch task_path(invalid_id), params: new_task_hash}.wont_change 'Task.count'
    
      must_redirect_to root_path
    end
  end
  
  # Complete these tests for Wave 4
  describe "destroy" do
    # Your tests go here
    before do
      Task.create(name: "Walk the dogs", description: "Remember to bring the water for the dogs!", completed_at: nil)
    end

    let (:new_task_hash) {
      {task: {
          name: "Walk the dogs and take the trash out",
          description: "Remember to bring trash out on the way!",
      }
    }}
    
    it 'will remove the task from the database and redirect back to root page' do
    task = Task.first
    expect{delete task_path(task.id), params: new_task_hash}.must_differ 'Task.count', -1

    must_redirect_to root_path
    end
  end
  
  # Complete for Wave 4
  describe "toggle_complete" do
    # Your tests go here
    before do
      Task.create(name: "Walk the dogs", description: "Remember to bring the water for the dogs!", completed_at: nil)
    end

    it 'will change the value of completed_at when the mark complete button is clicked' do
      # Arrange
      task = Task.first

      # Act
      patch task_complete_path(task.id)
      task.reload
      
      # Assert 
      # clicking the mark complete will update the completed at time from nil to time
      must_redirect_to task_path(task.id)
      assert_not_empty(task.completed_at)
    end

    it 'will change the value of completed_at back from Time to nil again if mark no completed button is click' do
      # Arrange 
      task = Task.first

      # Act
      # click the button twice to toggle the value of completed_at
      patch task_complete_path(task.id)
      patch task_complete_path(task.id)
      task.reload

      # Assert
      assert_nil(task.completed_at)
      #expect(task.completed_at).must_equal nil
    end
  end
end