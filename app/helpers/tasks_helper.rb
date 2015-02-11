module TasksHelper
  def print_tasks (tasks)
    content_tag(:ul ) do
      tasks.each do |task|
        tag = content_tag(:li) do 
          concat link_to task['name'], project_task_path(@project, task['id'])
          concat print_tasks(task['children']) unless task['children'].length.zero?
        end
        concat tag
      end
    end
  end
end
