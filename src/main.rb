data = ['m', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'x', 'w', 'w', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'x', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'x', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'w', 'w', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w']
sample_man = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/man.wav'
sample_woman = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/woman.wav'
sample_sitzung_begruessung = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_begruessung.wav'
sample_sitzung_eroeffnet = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_eroeffnet.wav'
sample_sitzung_glocke = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_glocke.wav'
trumpets = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Trumpet/TrumpetSect/Sustain/'

set :count_factor, 20
set :count_m, 0.0
set :count_w, 0.0
set :globalamp, 1
set :bpm, 100


use_bpm get[:bpm]

# Drums
live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.5
end

live_loop :drums do
  
  sample :drum_cymbal_open
  3.times do
    sample :drum_heavy_kick
    sleep 1
    sample :drum_snare_hard
    sleep 1
  end
  
  sample :drum_heavy_kick
  sleep 0.7
  sample :drum_snare_hard
  sleep 0.3
  sample :drum_snare_hard
  sleep 0.5
  sample :drum_snare_hard
  sleep 0.5
end

# Bass
live_loop :bass do
  use_synth :fm
  play :c2
  sleep 1
  play :ef2, amp: 2
  sleep 1
  play :d2
  sleep 1
  play :cs2
  sleep 1
  
  play :c2
  sleep 1
  play :ef2, amp: 2
  sleep 0.75
  play :ef2
  sleep 0.25
  play :d2
  sleep 0.25
  play :d2
  sleep 0.25
  play :d2
  sleep 0.5
  play :cs2
  sleep 0.5
  play :cs2
  sleep 0.5
end

in_thread do
  loop do
    sync :tick
    x = get[:position]
    if data[x] == 'm'
      rate_m = 1 + get[:count_m] / get[:count_factor]
      sample sample_man, rate: rate_m, amp: 1 + get[:count_m] / 10
      if x >= 16
        sample sample_man, rate: rate_m - 0.5, amp: 1 + get[:count_m] / 10
      end
      set :count_m, get[:count_m] + 1
    elsif data[x] == 'w'
      rate_w = 1 + get[:count_w] / get[:count_factor]
      sample sample_woman, rate: rate_w, amp: 1 + get[:count_m] / 10
      set :count_w, get[:count_w] + 1
      
    elsif data[x] == 'x'
      set :count_m, 0.0
      set :count_w, 0.0
      set :bpm, get[:bpm] + 10
      use_bpm get[:bpm]
    end
    
    
  end
end

define :begruessung do
  sample sample_sitzung_begruessung, amp: 4
  sleep 9
  sample sample_sitzung_eroeffnet, amp: 4
  sleep 3
  sample sample_sitzung_glocke, amp: 6
end

define :rundata do |from, to|
  count = 0
  for x in from..data.length() - 1
    set :position, x
    cue :tick
    
    if x % 16 == 0
      set :bpm, get[:bpm] + 10
    end
    sleep 2
    stop if x >= to
  end
end

define :trumpet do
  
  sample trumpets, "4_C", attack: 0, start: 0, release: 2.5, finish: 0.4
  sleep 0.5
  sample trumpets, "4_Eb", attack: 0, start: 0, release: 2.5, finish: 0.4
  sleep 1
  sample trumpets, "4_G", attack: 0, start: 0, release: 2.5, finish: 0.4
  sleep 0.5
  sample trumpets, "5_Eb", attack: 0, start: 0, release: 2.5, finish: 0.4
  sample trumpets, "5_G", attack: 0, start: 0, release: 2.5, finish: 0.4
  
  
end



sleep 17
begruessung

sleep 3
rundata 0, 15
sleep 15

trumpet

