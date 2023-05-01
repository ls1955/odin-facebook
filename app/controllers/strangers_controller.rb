class StrangersController < ApplicationController
  def index
    @strangers = current_user.strangers
  end
end
