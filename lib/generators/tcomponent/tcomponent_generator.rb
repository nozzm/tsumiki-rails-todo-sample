class TcomponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  # class_option :extend, type: :string, aliases: "-e", desc: "継承"

  def create_component
    template "component_template.erb", 
             "app/assets/javascripts/components/#{name.underscore}.js.rb"
  end

  def add_path_to_application
    append_to_file "app/assets/javascripts/application.js.rb" do
      "\nrequire_relative 'components/#{name.underscore}.js.rb'"
    end
  end
end
