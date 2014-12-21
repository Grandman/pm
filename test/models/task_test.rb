require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   def setup
     @task = tasks(:one)
   end
   test "should not valid without name" do
     @task.name = nil
     assert !@task.valid?, "task was valid when name is nil "
   end
   test "valid with name length between 3 and 30" do
     @task.name = "Task name"
     assert @task.valid?, "task was not valid when name length between 3 and 30"
   end
   test "invalid with name length more than 30" do
     @task.name = "Task name more then 30 syyyyymbooolllllssss"
     assert !@task.valid?, "task was valid when task name length more than 30"
   end 
   test "invalid with name length less than 3" do
     @task.name = "1"
     assert !@task.valid?, "task was valid when task name length less then 3"
   end
   test "should return nil if no children" do
     assert_equal [], @task.children
   end
   test "should return tasks if has children" do
     @task = tasks(:two)
     assert_equal [tasks(:three)], @task.children
   end
   test "should return parent" do
     @task = tasks(:three)
     assert_equal tasks(:two), @task.parent
   end
   test "should have project" do
     @task.project = nil
     assert !@task.valid?, "task was valid when project is nil"
   end

   test "end_at should not nil" do
     @task.end_at = nil
     assert !@task.valid?
   end
   test "end_at should not earlier than created_at" do
     @task = tasks(:two)
     assert !@task.valid?
   end
end
