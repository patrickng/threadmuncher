# copied from https://answersresource.wordpress.com/2014/10/11/ror-grape-and-devise-api-authentication/
# 
# might need to customize this

module Session
  class Data < Grape::API
    include Devise::Controllers::InternalHelpers

    resource :sessions do
      params do
        requires :login, type: String, desc: "Username or email address"
        requires :password, type: String, desc: "Password"
      end
      post do
        if params[:login].include?("@")
          user_resource = User.find_for_database_authentication(:email => params[:login])
        else
          user_resource = User.find_for_database_authentication(:login => params[:login])
        end

        return error!('Unauthorized. Invalid or expired token.', 401) unless user_resource

        if user_resource.valid_password?(params[:password])
          sign_in('user', user_resource)
          return { :auth_token => user_resource.authentication_token }
        end
        return error!('Unauthorized. Invalid username or password.', 401)
      end

      delete do
        sign_out('user')
      end
    end
  end
end