class Medium < ActiveRecord::Base
	include AutoHtml
	validates :url, presence: true
	
	belongs_to :space



	def render
		html = auto_html(url){
			html_escape;
    		image;
    		youtube(:width => 410, :height => 270, :class => 'brick');
    		soundcloud(:width => 410, :height => 160, :class => 'brick');
    		vimeo(:width => 410, :height => 270, :class => 'brick');
    		spotify(:width => 410, :height => 160, :class => 'brick');
    		link :target => "_blank", :rel => "nofollow";
    		simple_format
		}

	end

end
