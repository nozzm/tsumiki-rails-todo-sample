Tsumiki::Component.create ("TaskForm") {

  # 継承
  # extend "BaseClass"

  # html要素名
  # html_element "p"

  # html属性の定義
  # attributes {
  # 
  # }

  # 見た目の定義
  # appearance {
  # 
  # }

  # 構造の定義
  composition {
    form {
      task_form_item
        .type("text")
        .placeholder("タスクを記入")
        .id("task_name")
        .margin_right("20px")
        .style {
          width "350px"
        }

      task_form_item
        .type("date")
        .id("task_deadline")
        .margin_right("20px")

      task_form_item(on_click: :add_task)
        .type("button")
        .value("追加")
        .style {
          width "50px"
          color :white
          background_color "#0058FF"
          border :none
          cursor :pointer
        }
    }
  }
}

Tsumiki::Component.create ("TaskFormItem") {
  # 継承
  extend "FormComponent"

  # 見た目の定義
  appearance {
    height "20px"
    box_sizing "content-box"
    font_size "20px"
    padding "1%"
  }
}