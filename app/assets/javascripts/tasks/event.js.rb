Tsumiki::Page.event {
  add_task {
    name    = Document.find("#task_name").val
    deadline = Document.find("#task_deadline").val
    data = {
      name: name,
      deadline: deadline
    }

    HTTP.post("http://localhost:3000/tasks.json", payload: data) do |response|
      load_task
    end
  }

  load_task {
    HTTP.get("http://localhost:3000/tasks.json") do |response|
      state[:task_list] = response.json
    end
  }

  delete_task { |id|
    HTTP.delete("http://localhost:3000/tasks/#{id}.json") do |response|
      load_task
    end
  }

  delete_tasks {
    # checkedが取れそうにないのでjsで記述
    %x{
      const checkboxes = document.getElementsByName("task_delete")
      for (let i=0; i<checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          const id = checkboxes[i].value
          checkboxes[i].parentNode.parentNode.parentNode.parentNode.removeChild(checkboxes[i].parentNode.parentNode.parentNode)
          xhr = new XMLHttpRequest()
          xhr.open("DELETE", "http://localhost:3000/tasks/" + id + ".json", true)
          xhr.send(null)
        }
      }
    }
  }
}
