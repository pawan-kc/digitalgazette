PageClassRegistrar.add(
  'Gallery',
  :controller => 'gallery',
  :icon => 'gallery.png',
  :class_display_name => 'gallery',
  :class_description => :gallery_class_description,
  :class_group => ['gallery'],
  :order => 31
)

apply_mixin_to_model(Asset, AssetsHaveGalleries)

self.override_views = false
self.load_once = false
