POST_PATH = "_posts/"

desc "Create a new post for the first Thursday of next month"
task :post do
	t = Time.now
	next_event = first_thursday_of_next_month(t)

	filename = t.strftime("%Y-%m-%d-") + next_event.strftime("%B") + ".textile"

	data = ""
	data << "---\n"
	data << "layout: post\n"
	data << "title: " + next_event.strftime("%B %Y") + " Silisec\n"
	data << "event-summary: Silisec\n"
	data << "event-timezone: America/Los_Angeles\n"
	data << "event-start: " + next_event.strftime("%Y%m%d") + "T190000\n"
	data << "event-end: " + next_event.strftime("%Y%m%d") + "T230000\n"
	data << "event-location: Faultline Brewing Company\n"
	data << "---\n"
	data << "\n"
	data << "h1. " + next_event.strftime("%B %-d, %Y")
	data << "\n\n"
	data << "Silisec will be at Faultline Brewery and starts at 7pm."
	data << "\n"

	File.open(POST_PATH + filename, 'w') {|f| f.write(data) }
end

task :default => :post


def first_thursday_of_next_month(t)
  if t.day < 8 and t.wday == 4
    t
  else
    first_thursday_of_next_month(t + (60 * 60 * 24))
  end
end
