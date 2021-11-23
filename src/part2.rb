#data = ['m', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'x', 'w', 'w', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'x', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'x', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'w', 'w', 'w', 'w', 'm', 'm', 'm', 'w', 'm', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'w', 'w', 'w', 'w', 'm', 'm', 'w', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'w', 'm', 'm', 'w', 'm', 'w', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'w', 'm', 'w', 'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'w']
sample_man = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/man.wav'
sample_woman = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/woman.wav'
sample_sitzung_begruessung = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_begruessung.wav'
sample_sitzung_eroeffnet = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_eroeffnet.wav'
sample_sitzung_glocke = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_glocke.wav'
trumpets = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Trumpet/TrumpetSect/Sustain/'
cellotrem = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Cello/CelloSect/Tremulo/'
violintrem = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Violin/ViolinSect/Tremulo'
cello2 = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/VSCO2-CE/Strings/Cello Section/spic'

data = ['m', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm',
        'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm',
        'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w',
        'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w',
        'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w',
        'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm']
set :count_factor, 20
set :count_m, 0.0
set :count_w, 0.0
set :globalamp, 1
set :bassamp, 1
set :bpm, 100
set :endofsong, 0


use_bpm get[:bpm]

# Bass
live_loop :bass do
  
  
  amp = get[:bassamp]
  use_synth :fm
  play :c2, amp: amp
  sleep 1
  play :ef2, amp: amp + 2
  sleep 1
  play :d2, amp: amp
  sleep 1
  play :cs2, amp: amp
  sleep 1
  
  play :c2
  sleep 1
  play :ef2, amp: amp + 2
  sleep 0.75
  play :ef2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.5
  play :cs2, amp: amp
  sleep 0.5
  play :cs2, amp: amp
  sleep 0.5
  
  stop if get[:endofsong] == 1
  
end

in_thread do
  loop do
    sync :tick
    x = get[:position]
    
    # Men
    if data[x] == 'm'
      rate_m = 1 + get[:count_m] / get[:count_factor]
      sample sample_man, rate: rate_m, amp: 1 + get[:count_m] / 4
      set :count_m, get[:count_m] + 1
      
      # Women
    elsif data[x] == 'w'
      rate_w = 1 + get[:count_w] / get[:count_factor]
      sample sample_woman, rate: rate_w, amp: 1 + get[:count_m] / 4
      set :count_w, get[:count_w] + 1
      
    elsif data[x] == 'x'
      set :count_m, 0.0
      set :count_w, 0.0
      set :bpm, get[:bpm] + 10
      use_bpm get[:bpm]
    end
    
    
  end
end


define :rundata2time do |from, to|
  count = 0
  for x in from..to
    set :position, x
    cue :tick
    sleep 1
  end
end


# ========================= 2. VERSE


in_thread do
  10.times do
    sample :drum_cymbal_open
    sleep 0.5
    sample :drum_cymbal_soft
    sleep 0.3
    sample :drum_cymbal_soft
    sleep 0.2
    3.times do
      sample :drum_cymbal_soft
      sleep 0.5
      sample :drum_cymbal_soft
      sleep 0.3
      sample :drum_cymbal_soft
      sleep 0.2
    end
  end
end



set :count_m, 0.0
set :count_w, 0.0

in_thread do
  sleep 12
  in_thread do
    54.times do
      sample cello2, "C1_v2_RR2", amp: 3
      sample cello2, "spic_B1_v2_RR2", amp: 3
      sleep 0.5
    end
  end
end

in_thread do
  sleep 16
  
  use_synth :prophet
  in_thread do
    6.times do
      play_pattern_timed ['C4', 'Eb4', 'G4', 'D4', 'B3', 'B4', 'D4', 'F5'], 0.5, release: 1, amp: 1
    end
  end
end

in_thread do
  sleep 28
  for x in 0..5
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    
    
    sleep 0.5
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.21, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    
    sleep 1
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    
    sleep 0.5
  end
end

rundata2time 20, 60
set :endofsong, 1



