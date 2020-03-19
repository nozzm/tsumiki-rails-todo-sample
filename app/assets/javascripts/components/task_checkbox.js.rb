Tsumiki::Component.create ("TaskCheckbox") {

  # 継承
  # extend "BaseClass"

  # html要素名
  html_element "label"

  # html属性の定義
  # attributes {
  # 
  # }

  # 見た目の定義
  appearance {
    font_family "'Font Awesome 5 Free'"
  }

  # 構造の定義
  composition { |task_id: -1|
    class_name = "check-box"
    icon_class_name = "check-box-icon"

    form_component
      .type("checkbox")
      .name("task_delete")
      .value(task_id)
      .html_class(class_name)
      .style{
        display :none
      }

    label
      .html_class(icon_class_name)

    @page.css(".#{class_name} + .#{icon_class_name}:before") {
      content "'\\f0c8'"
      color "#ccc"
      font_size "30px"
    }
    @page.css(".#{class_name}:checked + .#{icon_class_name}:before") {
      content "'\\f14a'"
      color "#17bcdf"
      font_size "30px"
    }
  }
}