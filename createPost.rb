#!/usr/bin/env ruby
# Calculate the First Thursday of The Month and Return

# Recursive algorithm that is used to find the first Thursday of the month.
def first_thursday_of_next_month(t)
  if(t.day < 8)
    if(t.thursday?)
      return t
    else
      first_thursday_of_next_month(t + (60 * 60 * 24))
    end
  else
    first_thursday_of_next_month(t + (60 * 60 * 24))
  end
end

path = "_posts/"
t = Time.now
seconds_in_a_month = 2592000
next_month = (t + seconds_in_a_month).strftime("%B").to_s
filename = t.strftime("%Y-%m-%d-") + next_month + ".textile"

data = ""
data << "---\n"
data << "layout: post\n"
data << "title: " +  (t + seconds_in_a_month).strftime("%B %Y").to_s + " Silisec\n"
data << "---\n"
data << "\n"
data << "h1. " + first_thursday_of_next_month(Time.now).strftime("%B %-d, %Y")
data << "\n\n"
data << "Silisec will be at Faultline Brewery and starts at 7pm."
data << "\n"

File.open(path + filename, 'w') {|f| f.write(data) }





