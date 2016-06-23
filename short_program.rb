def self_reproduce
    this_file = __FILE__
    puts File.read(this_file)
    puts "I put myself"
end

self_reproduce
