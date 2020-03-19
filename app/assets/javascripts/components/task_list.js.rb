Tsumiki::Component.create ("TaskList") {

  # 継承
  # extend "BaseClass"

  # html要素名
  # html_element "p"

  # html属性の定義
  # attributes {
  # 
  # }

  # 見た目の定義
  appearance {
    width "600px"
    display "grid"
    grid_template_rows "40px 1fr"
  }

  # 構造の定義
  composition { |task: []|
    grid(col: "1fr 250px") {
      label(text: "タスク一覧")
        .style { font_size "30px" }
      button(text: "選択されたタスクを削除", on_click: :delete_tasks)
        .style {
          font_size "20px"
          border :none
          color :white
          background_color "#F24E73"
          cursor :pointer
          width "250px"
          height "30px"
          position :relative
          bottom "-10px"
        }
    }

    task
      .sort_by { |t| t["deadline"] }
      .each { |t|
      task_card(task_elem: t)
    }
  }
}