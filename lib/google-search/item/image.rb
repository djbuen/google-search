module Google
  class Search
    class Item
      class Image < self
        
        ##
        # Image id.
        
        attr_reader :id
        
        ##
        # Context uri.
        
        attr_reader :context_uri
        
        ##
        # Image width in pixels.
        
        attr_reader :width
        
        ##
        # Image height in pixels.
        
        attr_reader :height
        
        ##
        # Initialize with _hash_.

        def initialize hash
          l = Logger.new STDOUT
          l.info "hasash sa image #{hash}"
          super
          @id = hash['imageId']
          @context_uri = hash['originalContextUrl']
          @width = hash['width'].to_i
          @height = hash['height'].to_i
          @uri = hash['link']
          @thumbnail_uri = hash['image']['thumbnailLink']
          if hash['pagemap'] && hash['pagemap']['cse_thumbnail']
              @thumbnail_uri = hash['pagemap']['cse_thumbnail'].last['src']
          end
        end
      end
    end
  end
end
