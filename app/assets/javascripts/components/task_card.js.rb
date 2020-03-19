Tsumiki::Component.create ("TaskCard") {

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
    border "solid 2px #252525"
    width "600px"
    margin_top "10px"
    padding "0.5em"
    font_size "20px"
    box_sizing "border-box"
  }

  # 構造の定義
  composition { |task_elem: nil|
    grid(col: "50px 4fr 1fr 50px") {
      task_checkbox task_id: task_elem[:id]
      label text: task_elem[:name]
      label text: task_elem[:deadline]
      label(text: "❌", on_click: "delete_task #{task_elem[:id]}")
        .style {
          font_size "20px"
          padding_left "20px"
          cursor "pointer"
        }
    }
  }
}