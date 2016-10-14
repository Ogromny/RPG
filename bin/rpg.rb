require 'rpg'
require 'optionparser'

length = 0
options =
    {
        number: false, lowercase: false, uppercase: false, special: false
    }

parser =
    OptionParser.new do |opts|7
        opts.on('--length length') do |_length|
            length = Integer _length rescue abort 'Please input a number !'
        end

        opts.on('-n', '--number') do
            options[:number] = true
        end

        opts.on('-l', '--lowercase') do
            options[:lowercase] = true
        end

        opts.on('-u', '--uppercase') do
            options[:uppercase] = true
        end

        opts.on('-s', '--special') do
            options[:special] = true
        end
    end

parser.parse!

puts RPG::RPG.generate(length, options)