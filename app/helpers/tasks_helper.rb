module TasksHelper
  def print_subtasks (task)
    result = ""
    task.children.each do |subtask|
      result << "<ul><li>#{link_to subtask.name, [@project, subtask]}"
      if subtask.has_children?
        result << print_subtasks(subtask)
      end
      result << "</li></ul>"
    end
    raw(result)
  end
end
