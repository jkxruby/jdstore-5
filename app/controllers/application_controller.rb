class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def admin_required
  if !current_user.admin?
    redirect_to "/", alert: "you have no permission,😝"
  end
end

 def add_to_cart
   @product = Product.find(params[:id])
   current_cart.add_product_to_cart(@product)
   redirect_to :back
   flash[:notice] = "加入购物车成功"
 end

helper_method :current_cart
 def current_cart
   @current_cart ||= find_cart
 end

private
def find_cart
  cart = Cart.find_by(id: session[:cart_id])
  if cart.blank?
    cart = Cart.create
  end
  session[:cart_id] = cart.id
  return cart
end


end
