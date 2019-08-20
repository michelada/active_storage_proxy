class ProxyControllerGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def copy_proxy_controller_file
    copy_file "proxy_controller.rb", "app/controllers/active_storage/proxy_controller.rb"
  end
end
