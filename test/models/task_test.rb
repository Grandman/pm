require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   def setup
     @task = tasks(:one)
   end
   test "should not valid without name" do
     @task.name = nil
     assert !@task.valid?
   end
   test "valid with name length between 3 and 30" do
     @task.name = "Task name"
     assert @task.valid?
   end
   test "invalid with name length more then 30" do
     @task.name = "Task name more then 30 syyyyymbooolllllssss"
     assert !@task.valid?
   end 
   test "invalid with name length less then 3" do
     @task.name = "1"
     assert !@task.valid?
   end
end
