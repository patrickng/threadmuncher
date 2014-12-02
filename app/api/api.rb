class API < Grape::API
  version 'v1', using: :path
  format :json
  mount Posts::Data
  mount Categories::Data
end