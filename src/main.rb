data = ['m', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'x', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'w', 'x', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'x', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'w', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'w', 'w']
sample_man = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/man.wav'
sample_woman = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/woman.wav'

=begin
for x in 0..data.length() - 1
  puts data[x]
  if data[x] == 'm'
    sample sample_man, rate: 0.1
    sleep(0.5)
  elsif data[x] == 'w'
    sample sample_woman
    sleep(0.5)
  end
 end
=end



in_thread do
  loop do
    sync :tick
    x = get[:position]
    if data[x] == 'm'
      rate_m = 1 + get[:count_m] / 10
      sample sample_man, rate: rate_m
      set :count_m, get[:count_m] + 1
    elsif data[x] == 'w'
      rate_w = 1 + get[:count_w] / 10
      sample sample_woman, rate: rate_w
      set :count_w, get[:count_w] + 1
      
    elsif data[x] == 'x'
      set :count_m, 0.0
      set :count_w, 0.0
    end
    
    
  end
end


set :count_m, 0.0
set :count_w, 0.0

for x in 0..data.length() - 1
  set :position, x
  cue :tick
  sleep 1
end

#puts data.length()
#sleep 0.5