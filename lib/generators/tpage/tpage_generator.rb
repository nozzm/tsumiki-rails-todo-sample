class TpageGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  
  def create_files
    dir = "#{name.underscore.pluralize}"
    asset_dir = "app/assets/javascripts/" + dir

    empty_directory dir
    template "event.erb", "#{asset_dir}/event.js.rb"
    template "init_state.erb", "#{asset_dir}/init_state.js.rb"

    # view をそれぞれ作成
    args.each do |page_name|
      template "page.erb", "#{asset_dir}/#{page_name}.js.rb"

      # precompileに追記
      append_to_file "config/initializers/assets.rb" do
        "\nRails.application.config.assets.precompile << '#{dir}/#{page_name}.js.rb'"
      end

      # viewがあれば追記
      # (erbじゃない場合は知らん)
      if File.exist? "app/views/#{dir}/#{page_name}.html.erb"
        append_to_file "app/views/#{dir}/#{page_name}.html.erb" do
<<~EOS
<div id='app'></div>
<%= javascript_include_tag '#{dir}/#{page_name}' %>
EOS
        end
      end
    end
  end
end
