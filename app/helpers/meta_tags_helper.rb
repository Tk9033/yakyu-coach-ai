module MetaTagsHelper
  def default_meta_tags
    {
      title: t('meta.title'),
      description: t('meta.description'),
      og: {
        title: t('meta.ogp.title'),
        description: t('meta.ogp.description'),
        site_name: t('meta.ogp.site_name'),
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png')
      },
      twitter: {
        card: 'summary_large_image'
      }
    }
  end
end
