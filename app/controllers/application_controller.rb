class ApplicationController < ActionController::Base
    


    def after_sign_in_path_for(resource)
        gallery_index_path # Change this to your gallery path
      end
    
      # Redirect to login page after sign-out
      def after_sign_out_path_for(resource_or_scope)
        new_user_session_path # Redirects to login page
      end

    private
    def current_cart
        Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
   


end
