class API < Grape::API
  version 'v1', using: :path
  format :json

  module ErrorFormatter
    def self.call message, backtrace, options, env
      { :response_type => 'error', :response => message }.to_json
    end
  end

  rescue_from :all, :backtrace => true

  error_formatter :json, API::ErrorFormatter

  helpers do
    def warden
      env['warden']
    end

    def authenticated
      return home if warden.authenticated?
      params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
    end

    def current_user
      warden.user || @user
    end
  end

  mount Posts::Data
  mount Categories::Data
end