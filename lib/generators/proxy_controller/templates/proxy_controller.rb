# frozen_string_literal: true

# Takes a blob using a signed reference and proxies the contents of the blob
# Based on https://github.com/rails/rails/pull/34477/files
class ActiveStorage::ProxyController < ActiveStorage::BaseController
  include ActiveStorage::SetBlob

  def show
    expires_in(
      ActiveStorageProxy::Engine.config.proxy_urls_expire_in,
      public: ActiveStorageProxy::Engine.config.proxy_urls_public
    )

    @blob = @blob.representation(params[:variation_key]).processed if params[:variation_key]

    response.headers["Content-Type"] = @blob.content_type
    response.headers["Content-Disposition"] = ActionDispatch::Http::ContentDisposition.format(
      disposition: params[:disposition] || "inline",
      filename: @blob.filename.sanitized
    )

    @blob.download do |chunk|
      response.stream.write(chunk)
    end
  ensure
    response.stream.close
  end
end
