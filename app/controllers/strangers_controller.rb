class StrangersController < ApplicationController
  def index
    @strangers = User.strangers
  end
end
