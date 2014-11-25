module Categories
  class Entity < Grape::Entity

    expose :name, :description
  end
  
  class Data < Grape::API
    resource :categories do
      desc "Categories"

      get do
        categories = Category.all
        present categories, with: Categories::Entity
      end
    end
  end
end