ActionController::Routing::Routes.draw do |map|
  map.resources :articles, :categories
  map.articles_by_category 'category/:category_name', :controller => 'articles', :action => 'by_category'
  map.root :controller => 'articles'
end
