require_dependency "mavatar/application_controller"

module Mavatar
  class ImageController < ApplicationController
    def show
       redirect_to "http://www.gravatar.com/avatar/#{params[:hash]}", params
    end
  end
end
