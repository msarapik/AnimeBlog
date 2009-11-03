ActionController::Routing::Routes.draw do |map|
  map.resources :articles, :categories, :comments, :sessions

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.articles_by_category 'category/:category_name', :controller => 'articles', :action => 'by_category'
  map.articles_by_tag 'tags/:name', :controller => 'articles', :action => 'by_tag'
  map.root :controller => 'articles'
end
