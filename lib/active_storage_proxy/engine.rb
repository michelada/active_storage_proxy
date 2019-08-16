# frozen_string_literal: true

require_relative "./variant_download"

module ActiveStorageProxy
  class Engine < ::Rails::Engine
    isolate_namespace ActiveStorageProxy

    engine_name "active_storage_proxy"

    config.proxy_urls_expire_in = 1.year
    config.proxy_urls_public = true

    initializer "active_storage_proxy.routes" do |_app|
      config.after_initialize do |app|
        app.routes.prepend do
          scope ActiveStorage.routes_prefix do
            get "/proxy/:signed_id(/:variation_key)/*filename" => "active_storage/proxy#show", :as => :rails_proxy_blob
          end
        end
      end
    end
  end
end
