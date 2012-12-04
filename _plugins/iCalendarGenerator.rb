module Jekyll

  class CalendarEvent
    attr_accessor :summary
    attr_accessor :timezone
    attr_accessor :startdate
    attr_accessor :enddate
    attr_accessor :location
    
    def is_complete
      summary && startdate && enddate && location
    end
    
    def to_liquid
      {
        "summary" => self.summary,
        "start" => self.startdate,
        "end" => self.enddate,
        "location" => self.location,
        "timezone" => self.timezone
      }
    end
  end

  class ICalendarPage < Page
      def initialize(site, base, events)
        @site = site
        @base = base
        @dir = ''
        @name = 'calendar.ics'

        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'calendar.ics')
        self.data['events'] = events
      end
    end

  class ICalendarGenerator < Generator
    
    safe true
    
    def generate(site)
      if site.layouts.key? 'calendar'
        events = Array.new
        
        # It would probably be a good idea to only process n most recent posts,
        # so this file does not grow unbounded.
        site.posts.each do |post|
          event = CalendarEvent.new
          event.summary = post.data['event-summary']
          event.timezone = post.data['event-timezone']
          event.startdate = post.data['event-start']
          event.enddate = post.data['event-end']
          event.location = post.data['event-location']
          
          if event.is_complete
            events << event
          end
        end
        
        site.pages << ICalendarPage.new(site, site.source, events)
      end
    end
    
  end

end