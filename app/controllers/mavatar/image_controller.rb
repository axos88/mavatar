require_dependency "mavatar/application_controller"
require 'open-uri'

module Mavatar
  class ImageController < ApplicationController
    CACHE_TIME = 6.hours
    CLEANUP_FREQUENCY = 2000 # Every 2000 requests

    before_action :clean

    def show
      filename = File.join(Rails.root, 'tmp', 'cache', 'avatars', generate_cache_filename(params))

      File.delete(filename) if is_cache_invalidated?(filename)

      if is_cached?(filename)
        img = open_with_mkdir(filename).read
      else
        image_url = generate_remote_url_for_image(params)
        img = open(image_url).read

        open_with_mkdir(filename, 'wb') do |file|
          img.length
          file.write img
        end
      end

      response.headers['Cache-Control'] = "public, max-age=#{CACHE_TIME.to_i}"
      response.headers['Content-Type'] = 'image/jpeg'
      response.headers['Content-Disposition'] = 'inline'
      render text: img
    end

    private
      def open_with_mkdir(*args, &block)
        FileUtils.mkdir_p(File.dirname(args.first))
        open(*args, &block)
      end

      def req_from_params(params)
        req = params.dup
        req.delete :controller
        req.delete :action
        req.delete :hash

        req
      end

      def generate_cache_filename(params)
        hash = params[:hash]
        req = req_from_params(params)


        req.reduce(hash) do |name, (k, v)|
          name + "_#{k}=#{v}"
        end
      end

      def generate_remote_url_for_image(params)
        hash = params[:hash]
        req = req_from_params(params)

        "http://www.gravatar.com/avatar/#{hash}?#{req.to_query}"
      end

      def is_cached?(file)
        File.exists?(file)
      end

      def is_cache_invalidated?(file)
        is_cached?(file) && File.mtime(file) < CACHE_TIME.ago
      end


      def clean
        remove_old_cached_files if should_clean
      end

      def should_clean
        rand < 1/CLEANUP_FREQUENCY
      end

      def remove_old_cached_files
        p "remove"
      end
  end
end
