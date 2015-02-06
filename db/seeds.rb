if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinery_locations').blank?
      user.plugins.create(:name => "refinery_locations", :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

url = '/locations'

if defined?(Refinery::Page) and !Refinery::Page.exists?(:link_url => url)
  page = Refinery::Page.create(
    :title => "Locations",
    :link_url => url,
    :deletable => false,
    :menu_match => "^#{url}?(\/|\/.+?|)$"
  )

  Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
    page.parts.create(:title => default_page_part, :body => nil, :position => index)
  end
end

