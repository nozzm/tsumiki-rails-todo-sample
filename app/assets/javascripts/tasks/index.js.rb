require_relative 'event.rb'
require_relative 'init_state.rb'

Tsumiki::Page.create { |state|
  header {
    header_title text:"TODO App"
  }

  container {
    task_form
    task_list(task: state[:task_list], on_load: "load_task")
      .margin_top "100px"
  } .padding "30px 10%"
}
