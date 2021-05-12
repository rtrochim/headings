sample_data = [{ id: 1, title: "heading1", heading_level: 0 },
               { id: 2, title: "heading2", heading_level: 2 },
               { id: 3, title: "heading3", heading_level: 1 },
               { id: 4, title: "heading4", heading_level: 1 }]

test_data = [{ id: 1, title: "heading1", heading_level: 0 },
             { id: 2, title: "heading2", heading_level: 3 },
             { id: 3, title: "heading3", heading_level: 4 },
             { id: 4, title: "heading4", heading_level: 1 },
             { id: 5, title: "heading5", heading_level: 0 }]

def headings(records)
  arr_size = records.max_by { |r| r[:heading_level] }[:heading_level]
  counters = Array.new(arr_size, 0)
  records.each do |r|

    (r[:heading_level]-1..arr_size).each { |i| counters[i] = 0 }
    puts counters.inspect
    (r[:heading_level]..arr_size).each {|i| counters[i] +=1 }
    puts counters.inspect


    num = counters[0..r[:heading_level]].join(".")
    puts "#{"\t" * r[:heading_level]} #{num} #{r[:title].capitalize}\n"

  end
end

# def headings(records)
#   counters = Array.new(records.max_by { |r| r[:heading_level] }[:heading_level] + 1, 1)
#   records.each do |r|
#     counters = (counters.map.with_index { |x,i| [i,x] }.to_h.merge! (counters[0..r[:heading_level]].map! {|c| c+1}).map.with_index { |x,i| [i,x] }.to_h).values
#     num = counters[0..r[:heading_level]].join(".")
#     puts "#{"\t" * r[:heading_level]} #{num} #{r[:title].capitalize}\n"
#   end
# end

# def headings(records)
#   counters = Array.new(records.max_by { |r| r[:heading_level] }[:heading_level] + 1, 1)
#   level = 0
#   records.each do |r|
#     level <= counters[r[:heading_level]] ? counters[r[:heading_level]] += 1 : nil
#     num = counters[0..r[:heading_level]].join(".")
#     puts "#{"\t" * r[:heading_level]} #{num} #{r[:title].capitalize}\n"
#   end
# end
#
headings(sample_data)
puts "\n \n \n \n "
headings(test_data)
