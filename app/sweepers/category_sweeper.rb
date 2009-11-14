class CategorySweeper < ActionController::Caching::Sweeper
  observe Article, Category

  def after_save(obj)
    expire_cache(obj)
  end

  def after_destroy(obj)
    expire_cache(obj)
  end

  def expire_cache(obj)
    expire_fragment 'all_categories_cached'
  end
end
