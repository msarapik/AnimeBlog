ActionController::Routing::Routes.draw do |map|
  map.resources :articles, :categories, :sessions
  map.articles_by_category 'category/:category_name', :controller => 'articles', :action => 'by_category'
  map.root :controller => 'articles'

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
end
