module ORPG

    class ORPG

        ## Array used for generation
        @@number    = ('0' .. '9').to_a
        @@lowercase = ('a' .. 'z').to_a
        @@uppercase = ('A' .. 'Z').to_a
        @@special   = '"^$£øµ*:;./§!-+#~&²`\\_-@])[(=<>'.split(//)

        ## Return number randomised if no options passed
        def self.generate(length, options = {})
            options =
                {
                    number: false,
                    lowercase: false,
                    uppercase: false,
                    special: false
                }.merge(options)

            g = Array.new

            (length * 4).times { g << @@number.sample && g.shuffle! } if options[:number]
            (length * 4).times { g << @@lowercase.sample && g.shuffle! } if options[:lowercase]
            (length * 4).times { g << @@uppercase.sample && g.shuffle! } if options[:uppercase]
            (length * 4).times { g << @@special.sample && g.shuffle! } if options[:special]

            g.shuffle![0 ... length].join
        end

    end

end