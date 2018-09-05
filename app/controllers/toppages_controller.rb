class ToppagesController < ApplicationController
  def index
    @courses=Course.all
  end
end
