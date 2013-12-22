require 'rubygems'
require 'mongo'
require 'names'

#host名は自分のpcのやつ、
@con = Mongo::Connection.new("localhost", 40000)

#DB名とコレクションは自分で作ったもをを用いる
@col = @con['yoshiya']['sample']
@data = 'abcde' * 1000

def write_user_docs(iterations=0, name_count=200)
    iterations.times do |n|
        name_count.times do |m|
            doc = {
                :filename => "sample_code-#{m}",
                :updated_at => Time.now.utc,
                :username => Names::LIST[m],
                :data => @data
            }
            @col.insert(doc)
        end
    end
end

write_user_docs(100, 200)
