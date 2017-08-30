class WelcomeController < ApplicationController

def index
  flash[:notice] = "你好，新世纪！"
end

end
