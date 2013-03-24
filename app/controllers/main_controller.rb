class MainController < ActionController::Base
  def index
    render text: "", layout: "application"
  end
end
