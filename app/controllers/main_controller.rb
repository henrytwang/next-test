class MainController < ApplicationController
  def index
    @page = Page.new
  end
end
