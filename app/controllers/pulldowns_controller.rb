class PulldownsController < ApplicationController
  def index
    @pulldowns = Pulldown.order
  end
end
