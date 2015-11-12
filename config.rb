require 'digest/md5'
require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

helpers do
  def get_article_author(article)
    data.blog.authors.find { |a| a.email == article.data.author_email }
  end
end

###
# Configuration
###

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :relative_links, true

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build
configure :build do
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
end

# Blog
activate :blog do |blog|
  blog.layout = 'blog'
  blog.sources = 'blog/{title}.html'
  blog.permalink = '{title}.html'
  blog.tag_template = 'tag.html'
  blog.taglink = 'tags/{tag}.html'
end

# Deploys
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end

# Pretty URLs
activate :directory_indexes

# Automatically generate vendor prefixes for CSS
activate :autoprefixer
