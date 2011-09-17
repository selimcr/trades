module SeoHelper
  
  def seo_meta_title
    #h(@seo_descriptor && @seo_descriptor.meta_title)
    "Trades.com"
  end
  
  def seo_meta_keywords
    h(@seo_descriptor && @seo_descriptor.meta_keywords)
  end
  
  def seo_meta_description
    h(@seo_descriptor && @seo_descriptor.meta_description)
  end
  
  def seo_body
    textilize(@seo_descriptor && @seo_descriptor.body)
  end
  
end
