require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   test "Project should have name" do
        project = Project.new(name:"Project name")
        project2 = Project.new()
        assert project.valid?
        assert !project2.valid?
   end
end
