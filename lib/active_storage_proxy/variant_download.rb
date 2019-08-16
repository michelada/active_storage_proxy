# frozen_string_literal: true

module ActiveStorageProxy
  # Adds `download` for variants
  module VariantDownload
    def download(&block)
      service.download key, &block
    end
  end
end

ActiveSupport.on_load :active_storage_blob do
  ActiveStorage::Variant.prepend(ActiveStorageProxy::VariantDownload)
end
